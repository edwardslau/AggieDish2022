package com.mealteam.client;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.*;
import java.util.UUID;

import com.google.type.*;
import com.google.protobuf.*;
import com.google.protobuf.util.*;

import io.grpc.*;

import com.mealteam.common.Util;
import com.aggiedish.protos.model.ServiceGrpc;
import com.aggiedish.protos.model.AddFoodProductRequest;
import com.aggiedish.protos.model.Cart;
import com.aggiedish.protos.model.ContactInfo;
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
import com.aggiedish.protos.model.Menu;
import com.aggiedish.protos.model.Menu.MenuDay;
import com.aggiedish.protos.model.Order;
import com.aggiedish.protos.model.OrderStatus;
import com.aggiedish.protos.model.PaymentInfo;
import com.aggiedish.protos.model.RatingInfo;
import com.aggiedish.protos.model.SubmitCartRequest;

public class TestClient {

    private Channel channel;

    // Blocking stub waits for the server to respond,
    // and will return either a response or exception.
    private ServiceGrpc.ServiceBlockingStub blockingStub;

    private static final Logger logger = Logger.getLogger(TestClient.class.getName());

    private static final String DEBUG_EATERY_UUID = "debug-eatery-id";

    public TestClient(String host, int port) {
        // makes a channel builder from specified host and port.
        this(ManagedChannelBuilder.forAddress(host, port).usePlaintext());
    }

    public TestClient(ManagedChannelBuilder<?> channelBuilder) {
        // builds a new channel rom the given channel builder
        this.channel = channelBuilder.build();

        // generates a new blocking stub with the channel
        this.blockingStub = ServiceGrpc.newBlockingStub(channel);
    }

    public void addEatery() {
        // create a food product
        FoodProduct.SubItem subItem = FoodProduct.SubItem
            .newBuilder()
            .setName(Util.makeStringValue("Default Subitem"))
            .build();

        FoodProduct foodProduct = FoodProduct
            .newBuilder()
            .setName(Util.makeStringValue("Default Food Product"))
            .setDescription(Util.makeStringValue("Lorem ipsum"))
            .addAllergyCautionTag(Util.makeStringValue("Contains Peanuts"))
            .setCuisine(Util.makeStringValue("AMERICAN"))
            .addSubItem(subItem)
            .addTimeRangeServed(Util.makeTimeRange(0, 23))
            .setId(Util.makeStringValue(UUID.randomUUID().toString()))
            .setImage(Util.makeStringValue("https://via.placeholder.com/350x150"))
            .setPrice(Util.makeDoubleValue(10.50))
            .build();

        // create the menu day object
        Menu.MenuDay menuDay = Menu.MenuDay
            .newBuilder()
            .setDay(Util.makeStringValue("Sunday"))
            .addFoodProduct(foodProduct)
            .build();

        // create the menu
        Menu menu = Menu
            .newBuilder()
            .addMenuDay(menuDay)
            .build();

        LatLng latLng = LatLng
            .newBuilder()
            .setLatitude(10)
            .setLongitude(10)
            .build();

        PaymentInfo paymentInfo = PaymentInfo
            .newBuilder()
            .setAcceptsCash(Util.makeBoolValue(true))
            .setAcceptsCreditCard(Util.makeBoolValue(true))
            .setAcceptsCashEquivalent(Util.makeBoolValue(true))
            .build();

        RatingInfo ratingInfo = RatingInfo
            .newBuilder()
            .setStars(Util.makeFloatValue(1.2f))
            .build();

        ContactInfo contactInfo = ContactInfo
            .newBuilder()
            .setEmail(Util.makeStringValue("example@example.com"))
            .setWebsiteUrl(Util.makeStringValue("https://example.com"))
            .build();

        Eatery eatery = Eatery
            .newBuilder()
            .setMid(Util.makeInt64Value(1000l))
            .setName(Util.makeStringValue("Default Eatery"))
            .setCuisine(Cuisine.AMERICAN)
            .setLocation(Util.makeStringValue("Tercero"))
            .setPaymentInfo(paymentInfo)
            .setRating(ratingInfo).setContactInfo(contactInfo)
            .setImageUrl(Util.makeStringValue("https://via.placeholder.com/350x150"))
            .setPriceLevel(Util.makeInt32Value(1000))
            .setCoordinates(latLng)
            .setMenu(menu)
            .build();

        try {
            blockingStub.addEatery(eatery);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }
    }

    public void addFoodProduct() {
        AddFoodProductRequest.Builder reqBuilder = AddFoodProductRequest.newBuilder();

        FoodProduct.SubItem subItem = FoodProduct.SubItem
            .newBuilder()
            .setName(Util.makeStringValue("New Subitem"))
            .build();

        FoodProduct foodProduct = FoodProduct
            .newBuilder()
            .setName(Util.makeStringValue("New Food Product"))
            .setDescription(Util.makeStringValue("New Description"))
            .addAllergyCautionTag(Util.makeStringValue("No Allergens"))
            .setCuisine(Util.makeStringValue("AMERICAN"))
            .addSubItem(subItem)
            .addTimeRangeServed(Util.makeTimeRange(0, 23))
            .setId(Util.makeStringValue(UUID.randomUUID().toString()))
            .setImage(Util.makeStringValue("https://via.placeholder.com/350x150"))
            .setPrice(Util.makeDoubleValue(10.50))
            .build();

        AddFoodProductRequest request = reqBuilder
            .setEateryId(Util.makeStringValue(DEBUG_EATERY_UUID))
            .setFoodProduct(foodProduct)
            .setDay(Util.makeStringValue("Sunday"))
            .build();

        try {
            blockingStub.addFoodProduct(request);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }
    }

    public void getEateries() {
        // build request
        GetEateriesRequest.Builder reqBuilder = GetEateriesRequest.newBuilder();

        reqBuilder.addCuisine(Cuisine.AMERICAN);
        reqBuilder.addCuisine(Cuisine.MEXICAN);

        reqBuilder.setUserCoordinates(Util.makeCoordinate(0.0, 0.0));
        reqBuilder.setMaxDistance(Util.makeDoubleValue(20.0));

        reqBuilder.setGreaterThanStars(Util.makeDoubleValue(1.0));
        reqBuilder.setLessThanStars(Util.makeDoubleValue(2.0));

        GetEateriesRequest req = reqBuilder.build();

        // response object
        GetEateriesResponse res;

        try {
            res = blockingStub.getEateries(req);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }

        try {
            String json = JsonFormat.printer().includingDefaultValueFields().print(res);
            System.out.println(json);
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return;
        }
    }

    public void getEateryFoodProducts() {
        GetEateryFoodProductsRequest.Builder reqBuilder = GetEateryFoodProductsRequest.newBuilder();

        reqBuilder.setEateryId(Util.makeStringValue(DEBUG_EATERY_UUID));
        // reqBuilder.setDay(Util.makeStringValue("Sunday"));

        GetEateryFoodProductsRequest req = reqBuilder.build();

        GetEateryFoodProductsResponse res;

        try {
            res = blockingStub.getEateryFoodProducts(req);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }

        try {
            String json = JsonFormat.printer().includingDefaultValueFields().print(res);
            System.out.println(json);
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return;
        }
    }

    public void getFoodProduct() {
        GetFoodProductRequest.Builder reqBuilder = GetFoodProductRequest.newBuilder();

        reqBuilder.setEateryId(Util.makeStringValue(DEBUG_EATERY_UUID));
        reqBuilder.setFoodProductId(Util.makeStringValue("261cc0c6-d9ad-42a4-8f37-6ff6691c27d3"));

        GetFoodProductRequest req = reqBuilder.build();

        // response object
        GetFoodProductResponse res;

        try {
            res = blockingStub.getFoodProduct(req);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }

        try {
            String json = JsonFormat.printer().includingDefaultValueFields().print(res.getFoodProduct());
            System.out.println(json);
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return;
        }
    }

    public void submitCart() {
        final String DEBUG_FOOD_PRODUCT_UUID_1 = "debug-food-product-1";
        final String DEBUG_FOOD_PRODUCT_UUID_2 = "debug-food-product-2";

        Cart.Builder cartBuilder = Cart.newBuilder();

        cartBuilder.addFoodProductId(Util.makeStringValue(DEBUG_FOOD_PRODUCT_UUID_1));
        cartBuilder.addFoodProductId(Util.makeStringValue(DEBUG_FOOD_PRODUCT_UUID_2));

        Cart cart = cartBuilder.build();

        SubmitCartRequest req = SubmitCartRequest
            .newBuilder()
            .setCart(cart)
            .setUserId(Util.makeStringValue(UUID.randomUUID().toString()))
            .setEateryId(Util.makeStringValue(DEBUG_EATERY_UUID))
            .build();

        // response object
        Order res;

        try {
            res = blockingStub.submitCart(req);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }

        try {
            String json = JsonFormat.printer().includingDefaultValueFields().print(res);
            System.out.println(json);
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return;
        }
    }

    public void getOrder() {
        final String DEBUG_ORDER_UUID = "f1102d46-75ab-45b3-a9ba-72f84677b20a";

        GetOrderRequest.Builder reqBuilder = GetOrderRequest.newBuilder();

        reqBuilder.setOrderId(Util.makeStringValue(DEBUG_ORDER_UUID));

        GetOrderRequest req = reqBuilder.build();

        // response object
        Order res;

        try {
            res = blockingStub.getOrder(req);
        } catch (StatusRuntimeException e) {
            logger.log(Level.WARNING, "RPC Failed: {0}", e.getStatus());
            return;
        }

        try {
            String json = JsonFormat.printer().includingDefaultValueFields().print(res);
            System.out.println(json);
        } catch (InvalidProtocolBufferException e) {
            e.printStackTrace();
            return;
        }
    }

    public static void main(String[] args) {
        String host = args[0];
        int port = Integer.parseInt(args[1]);

        TestClient client = new TestClient(host, port);

        // uncomment debug functions as needed below

        // client.addEatery();
        // client.getEateries();
        // client.addFoodProduct();
        // client.getEateryFoodProducts();
        // client.getFoodProduct();
        // client.submitCart();
        // client.getOrder();
    }
}
