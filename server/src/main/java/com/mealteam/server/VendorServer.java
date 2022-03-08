package com.mealteam.server;

import java.io.IOException;

import java.util.logging.Logger;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import java.util.List;
import java.util.ArrayList;
import java.util.UUID;

import com.google.type.*;
import com.google.protobuf.*;
import com.google.protobuf.util.*;

import io.grpc.stub.StreamObserver;
import io.grpc.*;

import com.mongodb.DBObject;
import com.mongodb.BasicDBObject;
import com.mongodb.client.model.Filters;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;

import org.bson.Document;

import com.mealteam.common.Util;
import com.aggiedish.protos.model.ServiceGrpc;
import com.aggiedish.protos.model.AddFoodProductRequest;
import com.aggiedish.protos.model.Cuisine;
import com.aggiedish.protos.model.DayOpen;
import com.aggiedish.protos.model.DayOpen.TimeRange;
import com.aggiedish.protos.model.Eatery;
import com.aggiedish.protos.model.FoodProduct;
import com.aggiedish.protos.model.GetEateriesRequest;
import com.aggiedish.protos.model.GetEateriesResponse;
import com.aggiedish.protos.model.GetEateryFoodProductsRequest;
import com.aggiedish.protos.model.GetEateryFoodProductsResponse;
import com.aggiedish.protos.model.GetFoodProductRequest;
import com.aggiedish.protos.model.GetFoodProductResponse;
import com.aggiedish.protos.model.GetOrderRequest;
import com.aggiedish.protos.model.Order;
import com.aggiedish.protos.model.OrderStatus;
import com.aggiedish.protos.model.SubmitCartRequest;

public class VendorServer {

    // port our server is ran on
    private int port;

    // gRPC server
    private Server server;

    // db connection
    public static Database db;

    // logging utility
    private static final Logger logger = Logger.getLogger(VendorServer.class.getName());

    private static class VendorService extends ServiceGrpc.ServiceImplBase {

        private Document getFoodProductDocumentFromMenu(Document menu, String foodProductId) {

            // get list of menu days
            List<Document> menuDays = (List<Document>) menu.get("menuDay");

            // loop through all menuDays
            for (Document menuDay : menuDays) {
                // extract the food products and add to response
                List<Document> foodProducts = (List<Document>) menuDay.get("foodProduct");

                // loop through foodProducts
                for (Document foodProduct : foodProducts) {

                    // we found the food product we are looking for
                    if (foodProduct.getString("id").equals(foodProductId)) {
                        return foodProduct;
                    }
                }
            }

            return null;
        }

        @Override
        public void addFoodProduct(AddFoodProductRequest req, StreamObserver<Empty> res) {
            // get the eatery id for which we want to add the food product
            String eateryId = req.getEateryId().getValue();

            // to select proper day
            String day = req.getDay().getValue();

            // create the food product json
            Document document;

            try {
                String json = JsonFormat.printer().includingDefaultValueFields().print(req.getFoodProduct());
                document = Document.parse(json);
            } catch (InvalidProtocolBufferException e) {
                e.printStackTrace();
                res.onCompleted();
                return;
            }

            // build find query
            BasicDBObject query = new BasicDBObject();
            query.put("id", eateryId);
            query.put("menu.menuDay", new BasicDBObject("$elemMatch", new BasicDBObject("day", day)));

            // build update payload
            BasicDBObject update = new BasicDBObject();
            update.put("$push", new BasicDBObject("menu.menuDay.$.foodProduct", document));

            System.out.println("Query: " + query);
            System.out.println("Update: " + update);

            // insert into the collection
            MongoCollection<Document> collection = db.getCollection("eateries");
            collection.updateOne(query, update);

            // complete response to client
            res.onNext(Empty.newBuilder().build());
            res.onCompleted();
        }

        @Override
        public void addEatery(Eatery req, StreamObserver<Empty> res) {
            Document document;

            try {
                String json = JsonFormat.printer().includingDefaultValueFields().print(req);
                document = Document.parse(json);
            } catch (InvalidProtocolBufferException e) {
                e.printStackTrace();
                res.onCompleted();
                return;
            }

            MongoCollection<Document> collection = db.getCollection("eateries");
            collection.insertOne(document);

            Empty empty = Empty.newBuilder().build();

            // complete response to client
            res.onNext(empty);
            res.onCompleted();
        }

        @Override
        public void getEateries(GetEateriesRequest req, StreamObserver<GetEateriesResponse> res) {
            // find with filters
            BasicDBObject query = new BasicDBObject();

            // filters for restaurant name and phone number
            if (req.hasName()) query.put("name", new BasicDBObject("$regex", req.getName().getValue()));
            if (req.hasPhoneNumber()) query.put("phoneNumber", new BasicDBObject("$eq", req.getPhoneNumber()));

            // TODO(#66): Location filtering needs to be implemented, refer to GitHub Issue #66
            if (req.hasUserCoordinates() && req.hasMaxDistance()) {

            }

            // cuisine filter
            List<Cuisine> cuisines = req.getCuisineList();
            if (!cuisines.isEmpty()) {
                // convert enum values to strings
                java.util.ArrayList<String> cuisinesQuery = new java.util.ArrayList<>();
                for (Cuisine cuisine : cuisines)
                    cuisinesQuery.add(cuisine.getValueDescriptor().getName());

                // place into db query
                query.put("cuisine", new BasicDBObject("$in", cuisinesQuery));
            }

            // greater than stars filter
            if (req.hasGreaterThanStars()) {
                BasicDBObject greaterStarsFilter = new BasicDBObject();
                greaterStarsFilter.put("$gte", req.getGreaterThanStars().getValue());
                query.put("rating.stars", greaterStarsFilter);
            }

            // less than stars filter
            if (req.hasLessThanStars()) {
                BasicDBObject lessStarsFilter = new BasicDBObject();
                lessStarsFilter.put("$lte", req.getLessThanStars().getValue());
                query.put("rating.stars", lessStarsFilter);
            }

            System.out.println("Query: " + query);

            // fetch eatery collection from the database
            MongoCollection<Document> collection = db.getCollection("eateries");

            // found documents from DB
            FindIterable<Document> documents;

            // limit and skip if necessary
            if (req.hasLimit() && req.hasSkip()) {
                documents = collection.find(query).limit(req.getLimit().getValue()).skip(req.getSkip().getValue());
            } else {
                documents = collection.find(query);
            }

            // invoke json parser
            JsonFormat.Parser parser = JsonFormat.parser();

            // response object
            GetEateriesResponse.Builder resBuilder = GetEateriesResponse.newBuilder();

            for (Document document : documents) {
                // remove tag that won't fit proto schema
                document.remove("_id");

                document.remove("coordinates");

                Eatery.Builder builder = Eatery.newBuilder();

                try {
                    parser.merge(document.toJson(), builder);
                } catch (Exception e) {
                    e.printStackTrace();
                    continue;
                }

                // build response object with filtered eateries
                Eatery eatery = builder.build();
                resBuilder.addEateries(eatery);
            }

            // complete response to client
            res.onNext(resBuilder.build());
            res.onCompleted();
        }

        @Override
        public void getEateryFoodProducts(GetEateryFoodProductsRequest req, StreamObserver<GetEateryFoodProductsResponse> res) {
            // get the eatery id for which we want to add the food product
            String eateryId = req.getEateryId().getValue();

            // to select proper day
            String day = req.getDay().getValue();

            // build the general query object
            BasicDBObject query = new BasicDBObject();
            query.put("id", eateryId);

            System.out.println("Query: " + query);

            // response builder
            GetEateryFoodProductsResponse.Builder resBuilder = GetEateryFoodProductsResponse.newBuilder();

            // invoke json parser
            JsonFormat.Parser parser = JsonFormat.parser();

            // fetch eatery collection from the database
            MongoCollection<Document> collection = db.getCollection("eateries");

            // found eatery from DB (only one should return)
            Document document = collection.find(query).first();

            Document menu = document.get("menu", Document.class);
            List<Document> menuDays = (List<Document>) menu.get("menuDay");

            // loop through all menuDays
            for (Document menuDay : menuDays) {
                // if we need to filter by day do it here
                if (req.hasDay() && !req.getDay().getValue().equals(menuDay.getString("day"))) {
                    // skip the iteration for wrong day
                    continue;
                }

                // finally extract the food products and add to response
                List<Document> foodProducts = (List<Document>) menuDay.get("foodProduct");

                // loop through foodProducts
                for (Document foodProduct : foodProducts) {
                    FoodProduct.Builder foodProductBuilder = FoodProduct.newBuilder();

                    // extract the food product from the nested array
                    try {
                        parser.merge(foodProduct.toJson(), foodProductBuilder);
                    } catch (Exception e) {
                        e.printStackTrace();
                        continue;
                    }

                    // build response object with filtered eateries
                    resBuilder.addFoodProduct(foodProductBuilder.build());
                }
            }

            // complete response to client
            res.onNext(resBuilder.build());
            res.onCompleted();
        }

        @Override
        public void getFoodProduct(GetFoodProductRequest req, StreamObserver<GetFoodProductResponse> res) {
            String eateryId = req.getEateryId().getValue();
            String foodProductId = req.getFoodProductId().getValue();

            // build the general query object
            BasicDBObject query = new BasicDBObject();
            query.put("id", eateryId);

            System.out.println("Query: " + query);

            // response builder
            GetFoodProductResponse.Builder resBuilder = GetFoodProductResponse.newBuilder();
            FoodProduct.Builder resFoodProductBuilder = FoodProduct.newBuilder();

            // invoke json parser
            JsonFormat.Parser parser = JsonFormat.parser();

            // fetch eatery collection from the database
            MongoCollection<Document> collection = db.getCollection("eateries");

            // found eatery from DB (only one should return)
            Document document = collection.find(query).first();

            // get all menu days
            Document menu = document.get("menu", Document.class);

            // get food product document
            Document foodProductDocument = getFoodProductDocumentFromMenu(menu, foodProductId);

            // if we can't find a food product then fail (this shouldn't happen)
            if (foodProductDocument == null) {
                System.out.println("couldn't find food product by id");
                res.onCompleted();
                return;
            }

            // extract the food product from the nested array
            try {
                parser.merge(foodProductDocument.toJson(), resFoodProductBuilder);
            } catch (Exception e) {
                e.printStackTrace();
                res.onCompleted();
                return;
            }

            // build final payload
            resBuilder.setFoodProduct(resFoodProductBuilder.build());

            // complete response to client
            res.onNext(resBuilder.build());
            res.onCompleted();
        }

        @Override
        public void submitCart(SubmitCartRequest req, StreamObserver<Order> res) {
            // TODO: verify food products are actually from the eatery in the request

            Order.Builder orderBuilder =  Order.newBuilder();

            String orderUuid = UUID.randomUUID().toString();

            orderBuilder.setCart(req.getCart());
            orderBuilder.setOrderStatus(OrderStatus.ORDER_SUBMITTED);
            orderBuilder.setOrderId(StringValue.newBuilder().setValue(orderUuid));
            orderBuilder.setUserId(req.getUserId());
            orderBuilder.setEateryId(req.getEateryId());

            // build the final order object
            Order order = orderBuilder.build();

            Document document;

            try {
                String json = JsonFormat.printer().includingDefaultValueFields().print(order);
                document = Document.parse(json);
            } catch (InvalidProtocolBufferException e) {
                e.printStackTrace();
                res.onCompleted();
                return;
            }

            // insert into the collection
            MongoCollection<Document> collection = db.getCollection("orders");
            collection.insertOne(document);

            // complete response to client
            res.onNext(order);
            res.onCompleted();
        }

        @Override
        public void getOrder(GetOrderRequest req, StreamObserver<Order> res) {

            // response builder
            Order.Builder resBuilder = Order.newBuilder();

            // build query
            BasicDBObject query = new BasicDBObject();

            if (req.hasOrderId()) {
                query.put("orderId", new BasicDBObject("$eq", req.getOrderId().getValue()));
            } else {
                // return empty if there is no eatery id
                res.onNext(resBuilder.build());
                res.onCompleted();
                return;
            }

            System.out.println("Query: " + query);

            // fetch eatery collection from the database
            MongoCollection<Document> collection = db.getCollection("orders");

            // found documents from DB
            Document document = collection.find(query).first();

            // invoke json parser
            JsonFormat.Parser parser = JsonFormat.parser();

            // remove tag that won't fit proto schema
            document.remove("_id");

            try {
                parser.merge(document.toJson(), resBuilder);
            } catch (Exception e) {
                e.printStackTrace();
                res.onCompleted();
                return;
            }

            // complete response to client
            res.onNext(resBuilder.build());
            res.onCompleted();
        }
    }

    public VendorServer(int port) {
        // At some point we may want to pass in a data file here
        this(ServerBuilder.forPort(port), port);
    }

    public VendorServer(ServerBuilder<?> serverBuilder, int port) {
        this.port = port;
        // creates a new server with the specified service
        // and builds a gRPC server object
        server = serverBuilder.addService(new VendorService()).build();
    }

    public void start() throws IOException {
        server.start();
        logger.info("Server has started on port " + port);
    }

    /** Stop serving requests and shutdown resources. */
    public void stop() throws InterruptedException {
        if (server != null) {
            server.shutdown().awaitTermination(30, TimeUnit.SECONDS);
        }
    }

    /**
     * Await termination on the main thread since the grpc library uses daemon
     * threads.
     */
    private void blockUntilShutdown() throws InterruptedException {
        if (server != null) {
            server.awaitTermination();
        }
    }

    public static void main(String[] args) throws Exception {

        // check to see if we have the right args
        if (args.length == 0) {
            System.err.println("Specify DB config path!");
            return;
        }

        // spool up DB connection
        db = new Database();
        db.loadConfigAndConnect(args[0]);

        // specified in the grpc-java docs example.
        VendorServer vendorServer = new VendorServer(8980);
        vendorServer.start();
        vendorServer.blockUntilShutdown();
    }
}
