package com.cydeo.day1;

import java.sql.*;

public class ClosingConnections {

    public static void main(String[] args) throws SQLException {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "hr";
        String password = "hr";

     //    Connection connection = null;
     //   Statement statement = null;
     //   ResultSet resultSet = null;

        // try with resources-- only work with auto closable resources
        try (Connection connection = DriverManager.getConnection(url, username, password);
             Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             ResultSet resultSet = statement.executeQuery("SELECT * FROM Employees")) {

            resultSet.next();
            System.out.println(resultSet.getString(2));

        } catch (SQLException e) {
            System.out.println("Error occurred" + e.getMessage());
        }
    }
}
        /*
        try {
             connection = DriverManager.getConnection(url, username, password);
             statement = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
             resultSet = statement.executeQuery("SELECT * FROM Employees");

            System.out.println("ALL SUCCESSFUL");


        }catch (SQLException e){
            System.out.println("ERROR OCCURRED" + e.getMessage());
        }finally {

            try {
              if(resultSet!=null)  resultSet.close();
              if(statement!=null) statement.close();
              if(connection!=null) connection.close();
            }catch (SQLException e){
                System.out.println("ERROR WHILE CLOSING RESOURCES" + e.getMessage());
            }
        }
 }
}
*/