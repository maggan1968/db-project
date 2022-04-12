package com.cydeo.day1;

import java.sql.*;

public class FlexibleNavigation {

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "hr";
        String password = "hr";


            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM REGIONS");
    }
}
