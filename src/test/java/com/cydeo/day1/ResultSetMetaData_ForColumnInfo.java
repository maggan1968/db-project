package com.cydeo.day1;

import java.sql.*;

public class ResultSetMetaData_ForColumnInfo {
    public static void main(String[] args) {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "hr";
        String password = "hr";


        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Employees");

            ResultSetMetaData resultSetMetaData = resultSet.getMetaData();
            int columnCount = resultSetMetaData.getColumnCount();
            String firstColumName = resultSetMetaData.getColumnName(1);

            System.out.println("columnCount = " + columnCount);
            System.out.println("firstColumName = " + firstColumName);

            for (int columnIndex = 1; columnIndex < columnCount; columnIndex++) {
                System.out.println("resultSetMetaData.getColumnName(" + columnIndex + ") = " + resultSetMetaData.getColumnName(columnIndex));
            }


        } catch (SQLException e) {
            System.out.println("ERROR OCCURRED" + e.getMessage());
        }
    }
}
