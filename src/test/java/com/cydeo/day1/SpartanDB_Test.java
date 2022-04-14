package com.cydeo.day1;

import java.sql.*;

public class SpartanDB_Test {
    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "SP";
        String password = "SP";
        Connection connection = DriverManager.getConnection(url, username, password);
        Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet resultSet = statement.executeQuery("SELECT * FROM SPARTANS");

        //This table has SPARTAN_ID, NAME, GENDER, CREATED_IT, UPDATED_AT
        while (resultSet.next()) {

            System.out.println(resultSet.getString("SPARTAN_ID") + " " + resultSet.getString("NAME"));
        }
    }
}
