--This is how you write comment in sql
--single line comment look like this
/*
 This is how you write multi
 line comment
 */
 -- each query you write knows as sql SELECT statement
-- * means all, here it means all columns
-- from some table that exist in the database
-- Just like Java
-- SQL Statements and in semi-colon : and it's mandatory
SELECT * FROM REGIONS ;
--if you want to run second statement
--you just need to click the query to focus the cursor and click run
SELECT * FROM  COUNTRIES ;

SELECT * FROM  DEPARTMENTS ;

SELECT * FROM EMPLOYEES ;
--restricting columns in the result
--SQL IS SPACE INSENSITIVE
SELECT FIRST_NAME
FROM EMPLOYEES ;

-- IF YOU WANT TO MORE THAN ONE COLUMNS CAN BE SPECIFIED SEPARATED BY COME
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES ;

SELECT FIRST_NAME, LAST_NAME, EMAIL
FROM EMPLOYEES ;


SELECT * FROM JOB_HISTORY ;

SELECT * FROM  JOBS ;

SELECT * FROM LOCATIONS ;


/*
 TASK : SELECT SPECIFIC COLUMNS FROM OTHER TABLES
 TO GET YOURSELF FAMILIAR WITH HR DATABASE
 */