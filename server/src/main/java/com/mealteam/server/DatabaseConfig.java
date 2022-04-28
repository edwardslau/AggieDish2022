package com.mealteam.server;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class DatabaseConfig {

    @SerializedName("srv")
    @Expose
    private boolean srv;

    @SerializedName("ip")
    @Expose
    private String ip;

    @SerializedName("port")
    @Expose
    private String port;

    @SerializedName("username")
    @Expose
    private String username;

    @SerializedName("password")
    @Expose
    private String password;

    @SerializedName("dbName")
    @Expose
    private String dbName;

    /**
     * No args constructor for use in serialization
     *
     */
    public DatabaseConfig() {
    }

    /**
     * @param srv
     * @param password
     * @param port
     * @param ip
     * @param username
     * @param dbName
     */
    public DatabaseConfig(boolean srv, String ip, String port, String username, String password, String dbName) {
        super();
        this.srv = srv;
        this.ip = ip;
        this.port = port;
        this.username = username;
        this.password = password;
        this.dbName = dbName;
    }

    public boolean getSrv() {
        return srv;
    }

    public void setSrv(boolean srv) {
        this.srv = srv;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }
}
