package com.cydeo.day1;

import java.sql.*;

public class TestOracleConnection {
    public static void main(String[] args) throws SQLException {

        //step 1 : create connection by providing Connection information
        //this connection jdbc, also known as connection string
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

        Connection connection = DriverManager.getConnection(url,username,password);
        System.out.println("Successfully Connected");

        //once we have the connection, now we use this connection object to create statement object
        Statement statement = connection.createStatement();

        //once we have statement object, now we can execute query to get ResultSet
        // ResultSet Object store all the row data
        //It uses iterator to move through the row using the cursor to hold position where it's currently at
        ResultSet resultSet = statement.executeQuery("SELECT *FROM REGIONS");
        //By default, the cursor(pointer) of the ResultSet object is at
        //a location knows as BeforeFirst, basically right before the first row
        //in order to get the first row, you need to call next() method
        resultSet.next(); //now we are at first row

        //the resulting data has two column REGION_ID, REGION_NAME
        //IN ORDER TO access the cell value,
        //we use getX(X here is data type) method that accept 1 parameter
        //either using column name or using 1 based index
        // getString , getInt , getDouble and so on.. we will be just using getString for now
        System.out.println("rs.getString(\"REGION_ID\") = "
                + resultSet.getString("REGION_ID"));

        System.out.println("resultSet.getString(\"REGION_NAME\") = "
                + resultSet.getString("REGION_NAME"));

        //YOU can also use column index
        System.out.println("resultSet.getString(1) = " + resultSet.getString(1));
        System.out.println("resultSet.getString(2) = " + resultSet.getString(2));

        //now we now move to next row
        resultSet.next();
        System.out.println("rs.getString(\"REGION_ID\") = "
                + resultSet.getString("REGION_ID"));

        System.out.println("resultSet.getString(\"REGION_NAME\") = "
                + resultSet.getString("REGION_NAME"));

    }
}
