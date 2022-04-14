package com.cydeo.day2;

import java.sql.*;

public class GettingColumnInformation {



          /*
        ResultSet object only store Row data
        It does not store any column information
        like column names , column data type , column counts
        In order to get column information
        We need to get  ResultSetMetaData object from ResultSet

        What is MetaData?  It's data about data
        ResultSetMetaData hold information about the ResultObject
        like column name column data type and count

     */

        public static void main(String[] args) throws SQLException {

            String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE" ;
            String username = "hr" ;
            String password = "hr" ;

            Connection conn = DriverManager.getConnection(url,username,password) ;
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs   = stmt.executeQuery("SELECT * FROM EMPLOYEES") ;

         // we want to extract column information from abpve Result object
         // first we need to  ResultSetMetaData object by calling below method
         ResultSetMetaData resultSetMetaData= rs.getMetaData();
         //this ResultSetMetaData has 2 methods we care about
            //getColumnCount() method to get the count of column
            //getColumnName or getColumnLabel using 1 based index
            System.out.println("resultSetMetaData.getColumnCount() = " + resultSetMetaData.getColumnCount());

            System.out.println("resultSetMetaData.getColumnName(2) = " + resultSetMetaData.getColumnName(2));

            //now we know how to count how many column we have
            //and how to get the column name at specific position (starting with 1)
            //print out all column names--> for loop
            int totalColumnCount = resultSetMetaData.getColumnCount() ;

            for (int columnIndex = 1; columnIndex <= totalColumnCount ; columnIndex++) {

              //  System.out.println("rsmd.getColumnName( "+columnIndex+" ) = "
                 //       + resultSetMetaData.getColumnName(columnIndex));
                System.out.println(resultSetMetaData.getColumnName(columnIndex) );
            }
            // HOMEWORK:
            //now you know how to go through all the column
            //and how to go through all the row
            //write a piece of code that go through each and every cell
            //and print out it's value
            }
        }

