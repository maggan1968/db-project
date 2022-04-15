package com.cydeo.day3;

import com.cydeo.utility.DB_Util;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;

import static org.testng.Assert.assertEquals;


/**
 * Background : on Spartan UI All Data page ,
 * Search functionality has been acting up
 * It does not always return correct result count
 * You opened the defect , it has been fixed
 * and yet it occasionally comes back again
 * Now you are writing automated test to make sure
 * it works all the times
 *  few scenario you came up with
 *    search by gender should work
 *    search by partial name should work
 *    search by partial name + gender should
 *
 */

public class SpartanSearchTest {

    @BeforeClass
    public void setup(){
        //create connection ONLY ONCE! for all tests in this class
        String url = "jdbc:oracle:thin:@3.83.127.158:1521:XE";
        String username = "SP";
        String password = "SP";

        DB_Util.createConnection(url, username, password);
    }

    @AfterClass
    public void teardown(){

        // teardown the connection only once after all the tests in this class
        DB_Util.destroy();
    }
    @Test
    public void testSearchByGender(){

        //assuming yoy already used your awesome webdriver knoledge
        //to get actual result from that total count
        //or by counting the web table row and got below result
// ACT
        int actualResultMale  = 53;
        int actualResultFemale = 48;

        //now get expected from Database query
        //for Male: SELECT COUNT(*)AS COUNT FROM SPARTAN WHERE GENDER = 'Male'
        //for Female: SELECT COUNT(*) AS COUNT FROM SPARTAN WHERE GENDER = 'FEMALE'



        DB_Util.runQuery("SELECT COUNT(*)AS COUNT FROM SPARTANS WHERE GENDER = 'Male'");
        int expectedMaleResult = Integer.parseInt(DB_Util.getFirstRowFirstColumn());

        // assert
        assertEquals(actualResultMale, expectedMaleResult);

        DB_Util.runQuery("SELECT COUNT(*)AS COUNT FROM SPARTANS WHERE GENDER = 'Female'");
        int expectedFemaleResult = Integer.parseInt(DB_Util.getFirstRowFirstColumn());

        // assert
        assertEquals(actualResultFemale, expectedFemaleResult);


    }
}
