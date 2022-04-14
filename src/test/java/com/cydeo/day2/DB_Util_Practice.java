package com.cydeo.day2;

import com.cydeo.utility.DB_Util;

public class DB_Util_Practice {

    public static void main(String[] args) {

        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE" ;
        String username = "hr" ;
        String password = "hr" ;

        //This will create connection and save the connection to static variable of utility
        DB_Util.createConnection(url, username, password);
        //this will execute query and save the query result to static variable of utility
        DB_Util.runQuery("SELECT * FROM COUNTRIES");
        // this will print out every cell in the result
        DB_Util.displayAllData();

        //get 2nd column from 2nd row
        System.out.println("DB_Util.getCellValue(2, 2) = " + DB_Util.getCellValue(2, 2));

        // GET THE COUNTRY_NAME FROM THE 2ND ROW
        System.out.println("DB_Util.getCellValue(2, \"COUNTRY_NAME\") = " + DB_Util.getCellValue(2, "COUNTRY_NAME"));

        // GET ROW COUNT
        System.out.println("DB_Util.getRowCount() = " + DB_Util.getRowCount());

        //get column row
        System.out.println("DB_Util.getColumnCount() = " + DB_Util.getColumnCount());

        //This will clean up ResultSet, Statement, Connection object resources just like you destroyed
        DB_Util.destroy();

    }
}
