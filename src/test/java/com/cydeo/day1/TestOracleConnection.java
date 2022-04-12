package com.cydeo.day1;

import java.sql.*;

public class TestOracleConnection {
    public static void main(String[] args) throws SQLException {

        //step 1 : create connection by providing Connection information
        //this connection jdbc url, also known as connection string
        //syntax look like this jdbc:DataBaseType:subprotocal:@Host:port:SID

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "hr";
        String password = "hr";

        // now JDBC Provide utility class called DriverManager with many methods
        // the getConnection method accept 3 parameters url , username, password
        // according this information ,
        // it will first look for the driver of the database type you are connecting to
        // once it's found , use the rest of connection information like
        // host ip , username password , port , sid to make connection
        // MAKE SURE YOUR CONNECTION WORK MANUALLY ,
        // ANYTHING DOES NOT WORK MANUALLY WILL NOT WORK AUTOMATION

        Connection connection = DriverManager.getConnection(url, username, password);
        System.out.println("Successfully Connected");

    }
}