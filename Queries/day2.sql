

--WHAT ABOUT THE PARTIAL SEARCH
--WE USE LIKE AND % (WILD CARD)
--% can represent 0 or more character of any kind
-- _ can represent exactly one character of any kind

/*
   'D%'  --anything that starts with D
        David , Danny, Dog

   '%d'   --anything that end with d
         Sid, Bid ,  Kid

   '%d%'  --anything that contains with d
         Aladdin, Cassandra, Adam

   'D%a'  --anything that starts with D and end with a
         Diana, Donna, Damla

   'S%e%n'-- any start with S end with n
         -- and has e something in the middle
         Steven, Stephen, Selen, Serkan, Sebastian

   'T_'  -- Starts with T and followed by exactly
            one character of any kind
            Tj, TD, Ta, T!, TV, T2

   '_a_' -- starts with any one character,followed by a
             and followed by any one character
            Dad, Man, Fat,Tab, Gab, MAd

 */
SELECT  FIRST_NAME FROM EMPLOYEES
--WHERE FIRST_NAME LIKE 'Da%';--9ROWS
--WHERE FIRST_NAME LIKE 'D%' ;
--WHERE FIRST_NAME LIKE '%d';--6 ROWS
WHERE FIRST_NAME LIKE 'S%e%n';


SELECT PHONE_NUMBER FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '515%';--21 ROWS STARTS WITH 512

SELECT PHONE_NUMBER FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '%.121.%'; --8 ROWS CONTAINS WITH 121

--YOU CAN OPTIONALLY GIVE AN ALIAS(NICKNAME) FOR YOUR COLUMN
--TO CHANGE THE RESULTING COLUMN NAME (ONLY CHANGING DISPLAY NOT ACTUALLY NAME
--USING THE KEY
-- Display all FIRST_NAME, SALARY in Employee table
--modify the column name for Salary in result to Money
SELECT FIRST_NAME,SALARY AS MONEY
FROM EMPLOYEES;


-- Display all FIRST_NAME, LAST_NAME in Employee table
--modify the column name for AS BELOW
--FIRST_NAME -> GIVEN_NAME    LAST_NAME  -> FAMILY_NAME
SELECT FIRST_NAME AS GIVEN_NAME, LAST_NAME AS FAMILY_NAME
FROM EMPLOYEES;


-- Display all FIRST_NAME, LAST_NAME in Employee table
--modify the column name for AS BELOW
--FIRST_NAME -> GIVEN NAME    LAST_NAME  -> FAMILY NAME
SELECT FIRST_NAME AS "GIVEN NAME", LAST_NAME AS "FAMILY NAME"
FROM EMPLOYEES;


--CONCATENATION IN SQL USE DOUBLE PIPE || (THIS IS NOT OR)
--DISPLAY FIRST_NAME,  LAST_NAME, FULL NAME, FOR EMPLOYEE

SELECT FIRST_NAME, LAST_NAME,
       FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME"
FROM EMPLOYEES;


---ARITHMETIC OPERATION: + - * /
--Display EMPLOYEE FIRST_NAME AND SALARY AND INCREASED_SALARY AFTER 5000$ RAISE
--AND INCREASED_SALARY AFTER 5000$ RAISE
SELECT FIRST_NAME, SALARY,
       SALARY + 5000 AS "INCREASED_SALARY"
FROM EMPLOYEES;

--AND DECREASED_SALARY AFTER 2000$ CUT
SELECT FIRST_NAME, SALARY,
       SALARY - 2000 AS "DECREASED_SALARY"
FROM EMPLOYEES;

--AND YEARLY_SALARY -- MULTIPLY BY 12
SELECT FIRST_NAME, SALARY,
       SALARY * 12 AS  "YEARLY_SALARY"
FROM EMPLOYEES;

--AND WEEKLY_ SALARY -- DIVIDE BY 4
SELECT FIRST_NAME, SALARY,
       SALARY /4 AS "WEEKLY_ SALARY"
FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY,
       SALARY + 5000 AS "INCREASED_SALARY",
       SALARY - 2000 AS "DECREASED_SALARY",
       SALARY * 12 AS  "YEARLY_SALARY",
       SALARY /4 AS "WEEKLY_ SALARY"
FROM EMPLOYEES;


