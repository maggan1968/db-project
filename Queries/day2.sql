

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


--IN ONE SHOT!!
SELECT FIRST_NAME, SALARY,
       SALARY + 5000 AS "INCREASED_SALARY",
       SALARY - 2000 AS "DECREASED_SALARY",
       SALARY * 12 AS  "YEARLY_SALARY",
       SALARY /4 AS "WEEKLY_ SALARY"
FROM EMPLOYEES;


--- SQL BUILT-IN FUNCTIONS:
--- REUSABLE CODE THAT WRAPPED INTO FUNCTION FOR COMMON TASKS
--LIKE ROUNDING NUMBERS, GETTING LENGTH OF STR AND MORE
--SINGLE ROW FUNCTION:
  -- IT AFFECT EACH AND EVERY ROW AND RETURN SAME NUMBER OF ROW


  -- FEW TEXT FUNCTIONS:
--Display FIRST_NAME, and UPPERCASE FIRST NAME IN EMPLOYEE TABLE
SELECT FIRST_NAME,
       -- UPPER, ACCEPT ONE PARAMETER (COLUMN NAME) AND RETURN UPPERCASE
       UPPER(FIRST_NAME)AS "UPPERCASE_NAME",--Ellen --> ELLEN

       -- LOWER, ACCEPT ONE PARAMETER (COLUMN NAME) AND RETURN LOWERCASE
       LOWER(FIRST_NAME)AS "LOWERCASE_NAME",-- Ellen  --> ellen

       -- LENGTH, RETURN THE LENGTH OF STRING
       LENGTH(FIRST_NAME)AS "CHAR_COUNT" -- 5
FROM EMPLOYEES;


--- FIND OUT ALL FIRST_NAME AND CHARACTER COUNT
-- ONLY DISPLAY IF CHARACTER COUNT IS EXACTLY 5
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = 5;


-- ONLY DISPLAY FIRST_NAME AND CHARACTER COUNT IS MORE THAN 10
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) > 10;

-- ONLY DISPLAY FIRST_NAME AND CHARACTER COUNT NOT BETWEEN 5 - 10
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) NOT BETWEEN 5 AND 10;

-- ONLY DISPLAY FIRST_NAME AND CHARACTER COUNT IS BETWEEN 7 - 9
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) BETWEEN 7 AND 9;

-- ONLY DISPLAY FIRST_NAME AND CHARACTER COUNT IS 2 OR 9 OR 11
SELECT FIRST_NAME,LENGTH(FIRST_NAME)
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) IN(2,9,11);




--FIND OUT ALL FIRST_NAME THAT CONTAINS d or D
SELECT FIRST_NAME, UPPER(FIRST_NAME)
FROM EMPLOYEES
--WHERE FIRST_NAME LIKE '%D%' OR FIRST_NAME LIKE '%d%';
WHERE UPPER(FIRST_NAME)LIKE '%D%';


-- NUMBER FUNCTION:
-- ROUND( DECIMAL NUMBER HERE) ---> ROUNDER NUMBER
-- ROUND(3.3333333)= >3
-- ROUND( DECIMAL NUMBER HERE,DIGIT YOU WANNA KEEP)
-- --->  ROUNDER NUMBER WITH DESIRED DIGIT

--FIND OUT SALARY AND  DAILY SALARY OF EMPLOYEE
SELECT SALARY,
       ROUND(SALARY/30),
       ROUND(SALARY/30, 4 )--17000/30=566.6667
FROM EMPLOYEES;



-- HOW DO YOU SORTING?
--YOU CAN USE SINGLE ROW ANYWHERE
--Including in select column list, condition, order by
SELECT FIRST_NAME
FROM EMPLOYEES
ORDER BY LENGTH(FIRST_NAME) DESC ;



--MULTI ROW FUNCTIONS  |  GRUOP FUNCTIONS  | AGGREGATE FUNCTIONS
--COUNT, MAX, MIN, SUM, AVG

-- You can use COUNT function either with * or column name
--when used with * it will just return the row count
--when used with column name it will return non-null row count only
SELECT COUNT(*), COUNT(FIRST_NAME)
FROM EMPLOYEES;
-- we have only 35 employee with COMMISSION_PCT value not null
SELECT COUNT(COMMISSION_PCT)
FROM EMPLOYEES;



---GET THE EMPLOYEE COUNT FOR EMPLOYEES WITH DEPARTMENT_ID 90
SELECT  *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;


--MAX
-- FIND OUT THE MAX SALARY IN EMPLOYEES TABLE
SELECT MAX(SALARY)
FROM EMPLOYEES;


----FIND OUT THE MAX SALARY IN EMPLOYEES TABLE
-- EXCLUDE THE SALARY 24000

SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE SALARY <> 24000;--17000


--MIN
-- FIND OUT THE MINIMUM SALARY IN EMPLOYEES TABLE
SELECT MIN(SALARY)
FROM EMPLOYEES;

-- FIND OUT THE MINIMUM SALARY IN EMPLOYEES TABLE
-- EXCLUDE THE SALARY 2100
SELECT MIN(SALARY)
FROM EMPLOYEES
WHERE SALARY <> 2100;


---SUM
---GET THE SUM ENTIRE EMPLOYEES SALARY
SELECT SUM(SALARY)
FROM EMPLOYEES;


---GET THE SUM ENTIRE EMPLOYEES SALARY FOR DEPARTMENT_ID 90?
SELECT SUM(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90;


--AVG
--FIND OUT AVERAGE  SALARY FOR ALL EMPLOYEES
SELECT AVG(SALARY), ROUND(AVG(SALARY) )
FROM EMPLOYEES;


-- ALL IN ONE SHOT
SELECT COUNT(*)AS "EMPLOYEE COUNT" ,
       MAX(SALARY) AS "HIGHST SALARY",
       MIN(SALARY) AS "LOWEST SALARY",
       SUM(SALARY) AS "SUM OF ALL SALARY",
       AVG(SALARY) AS "AVERAGE SALARY"
FROM EMPLOYEES;



----------GROUP BY----
-- CAN BE USED ALONG WITH MULTI-ROW (AGGREGATE, GROUP)FUNCTIONS
-- --------

-- DISPLAY CUNT OF EMPLOYEES IN EACH DEPARTMENT

SELECT  DEPARTMENT_ID,
       COUNT(*)AS "DEP_EMP_COUNT"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- DISPLAY CUNT OF EMPLOYEES IN EACH JOB_ID
SELECT JOB_ID,
       COUNT(*)AS "IT_PROG"
FROM EMPLOYEES
GROUP BY  JOB_ID;


---DISPLAY THE MAX SALARY OF EACH DEPARTMENT
SELECT DEPARTMENT_ID,MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

--- DISPLAY MIN SALARY OF EACH DEPARTMENT
SELECT DEPARTMENT_ID,MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

---DISPLAY THE AVG SALARY OF EACH DEPARTMENT
SELECT DEPARTMENT_ID,AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


---DISPLAY THE SUM SALARY OF EACH DEPARTMENT
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


---IN ONE SHOT!

SELECT DEPARTMENT_ID,
       MAX(SALARY)AS "HIGHEST SALARY",
       MIN(SALARY) AS "LOWEST SALARY",
       ROUND(AVG(SALARY)) AS "AVARAGE SALARY",
       SUM(SALARY)AS "TOTAL SALARY"
FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;

---DISPLAY MAX SALARY EACH JOB_ID
SELECT JOB_ID,MAX(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

---DISPLAY MIN SALARY EACH JOB_ID



---DISPLAY COUNT OF COUNTRIES IN EACH REGION
SELECT REGION_ID,
       COUNT(*) AS "COUNT_OF_COUNTRIES"
FROM COUNTRIES
GROUP BY REGION_ID;














