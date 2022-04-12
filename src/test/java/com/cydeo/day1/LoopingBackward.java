package com.cydeo.day1;

import java.sql.*;

public class LoopingBackward {
    public static void main(String[] args) throws SQLException {

        // print all Employees Employee_ID and First_Name backward
        // SELECT * FROM EMPLOYEES  (do not sort this)


            String url = "jdbc:oracle:thin:@54.236.150.168:1521:XE" ;
            String username = "hr" ;
            String password = "hr" ;

            Connection connection = DriverManager.getConnection(url,username,password) ;
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet resultSet   = statement.executeQuery("SELECT * FROM EMPLOYEES") ;


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

        // USE afterLast() method to go  to after last location
        // use previous() method to move backward
        // and check whether we have valid previous row or not
        //stop if there is no more valid row
        resultSet.afterLast();

        while (resultSet.previous()){
            System.out.println(resultSet.getString("EMPLOYEE_ID") + " "
                    + resultSet.getString("FIRST_NAME"));
        }

    }
}
