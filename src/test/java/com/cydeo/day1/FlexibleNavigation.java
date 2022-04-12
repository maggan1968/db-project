package com.cydeo.day1;

import java.sql.*;

public class FlexibleNavigation {

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "hr";
        String password = "hr";


            Connection connection = DriverManager.getConnection(url, username, password);
            //creating statement this way will only allow to
        //get ResultSet tht forward only when we executeQuery

        //Statement statement = connection.createStatement();
        //in order to be able to move through any row in the resultSet
        //with the help of ResultSet navigation method like next previous absolute
        //we need to create Statement object in below way

        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
            ResultSet resultSet = statement.executeQuery("SELECT * FROM REGIONS");

        /*
         * In order to access data in ResultSet object , we need to use cursor navigation methods :
         *
         * next() -move to next row and return true false according to if we have valid row
         * previous() -move to previous row and return true false according to if we have valid row
         * first() - move to first row from anywhere
         * last() - move to last row from anywhere
         * beforeFirst() - move to before first location from anywhere
         * afterLast() - move to after last location from anywhere
         * absolute(8) - move to any row by using row number , for example 8 in this case
         */

        resultSet.next() ; // row 1
        System.out.println("resultSet.next() :" + resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));

        resultSet.last() ; // last row , row 4
        System.out.println("resultSet.last() :" +resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));

        resultSet.first(); // row 1
        System.out.println("resultSet.first() :" +resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));

        resultSet.absolute(3); // row 3
        System.out.println("resultSet.absolute(3) :" +resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));

        resultSet.previous(); //row 2
        System.out.println("resultSet.previous() :" +resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));

        resultSet.beforeFirst();// before first location
        System.out.println("resultSet.beforeFirst() :" +resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));

        resultSet.next(); // row 1;
        resultSet.afterLast();//now we are at after last location, nothing is here
        resultSet.previous();//last row , row 4
        System.out.println("resultSet.previous() :" +resultSet.getString("REGION_ID") +" "+ resultSet.getString("REGION_NAME"));




    }
}
