package com.cydeo.day1;

import java.sql.*;

public class LoopingThroughResultSet {

    public static void main(String[] args)  {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "hr";
        String password = "hr";

    try{
        Connection connection = DriverManager.getConnection(url, username, password);
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT * FROM REGIONS");

    // keep looping to next row until there is no more rows when resultSet.next() return false
        //resultSet.next() move the pointer to next row
        //and return true if there is valid next row and false if there is no valid next row
        while (resultSet.next()){
            System.out.println("resultSet.getString(\"REGION_NAME\") = "
                    + resultSet.getString("REGION_NAME"));
        }
    // where is your pointer right now??--> AfterLast Location
        //below line will throw exception because we are at afterlast location
        // System.out.println("resultSet.getString(\"REGION_NAME\") = "
        //                    + resultSet.getString("REGION_NAME"));

    }catch(SQLException e){
         System.out.println("Exception occurred " + e.getMessage() );
}
    }
    }

