package com.mealteam.server;

import java.io.Reader;

import java.nio.file.Files;
import java.nio.file.Paths;

import com.google.gson.Gson;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import org.bson.Document;

public class Database {

    DatabaseConfig dbConfig;
    MongoClient mongoClient;
    MongoDatabase db;

    public static String buildMongoUriString(boolean srv, String hostname, String port, String username,
            String password, String dbName) {
        if (srv) {
            return "mongodb+srv://" + username + ":" + password + "@" + hostname + "/" + dbName;
        } else {
            return "mongodb://" + username + ":" + password + "@" + hostname + ":" + port + "/" + dbName;
        }
    }

    public boolean loadConfigAndConnect(String dbConfigPath) {
        // load in the config file
        try {
            Gson gson = new Gson();
            Reader reader = Files.newBufferedReader(Paths.get(dbConfigPath));
            this.dbConfig = gson.fromJson(reader, DatabaseConfig.class);
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }

        // establish connection to database
        this.mongoClient = new MongoClient(new MongoClientURI(
                buildMongoUriString(this.dbConfig.getSrv(), this.dbConfig.getIp(), this.dbConfig.getPort(),
                        this.dbConfig.getUsername(), this.dbConfig.getPassword(), this.dbConfig.getDbName())));

        // fetch the database object that holds all our collections
        this.db = this.mongoClient.getDatabase(this.dbConfig.getDbName());

        return true;
    }

    public MongoCollection<Document> getCollection(String collectionName) {
        return this.db.getCollection(collectionName);
    }
}
