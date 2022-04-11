-- 1. get me all data from employees table
SELECT *
FROM EMPLOYEES;

-- 2. get me first_name, phone_number and salary from employees
SELECT FIRST_NAME, PHONE_NUMBER,SALARY
FROM EMPLOYEES;

-- 3. get me unique job_id from __ table
SELECT DISTINCT JOB_ID
FROM JOBS;

-- 4. get me all ST_CLERK from employee table
SELECT JOB_ID, FIRST_NAME
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

-- 5. get me postal_code from JP,UK,CA
SELECT POSTAL_CODE,COUNTRY_ID
FROM LOCATIONS
    WHERE COUNTRY_ID = 'JP'OR COUNTRY_ID = 'UK' OR COUNTRY_ID = 'CA';

SELECT POSTAL_CODE,COUNTRY_ID
FROM LOCATIONS
WHERE COUNTRY_ID IN ('JP','UK','CA');

-- 6. get me city not in CH,US
SELECT CITY, COUNTRY_ID
FROM LOCATIONS
    WHERE COUNTRY_ID NOT IN ('CH', 'US');
-- 7. get me job_title whose min_salary is more than 4000 and less than 9000
SELECT JOB_TITLE, MIN_SALARY
FROM JOBS
    WHERE MIN_SALARY> 4000 AND MIN_SALARY<9000;

SELECT JOB_TITLE, MIN_SALARY
FROM JOBS
WHERE MIN_SALARY BETWEEN 4000 AND 9000;

-- 8. get me null state_province in locations table
SELECT STATE_PROVINCE
FROM LOCATIONS
    WHERE STATE_PROVINCE IS NULL ;
-- 9. get me manager_id in departments table
SELECT MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL ;

-- 10. get me employee_id and start_date who starts in 2001
SELECT EMPLOYEE_ID,START_DATE
FROM JOB_HISTORY
WHERE START_DATE LIKE '%2001%';


-- 11. get me all employee first_name who works in some CLERK position
SELECT FIRST_NAME,JOB_ID
FROM EMPLOYEES
WHERE JOB_ID LIKE '%CLERK%';

-- 12. get me email whose email is 6 letter and 4th letter of email is E
SELECT EMAIL
FROM EMPLOYEES
WHERE EMAIL LIKE '___E__';

SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '-------';

-- 13. get me last_name according to their hire_date
SELECT LAST_NAME,HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE;

-- 14. get me first_name ascending and salary descending
SELECT FIRST_NAME,SALARY
FROM EMPLOYEES
ORDER BY FIRST_NAME ASC,SALARY DESC ;

---AGGREGATE FUNCTIONS COUNT, MAX, MIN, SUM, AVG-----------

-- 15. get me manager_id from departments
SELECT MANAGER_ID
FROM DEPARTMENTS
WHERE MANAGER_ID IS NOT NULL ;

SELECT COUNT(MANAGER_ID)
FROM DEPARTMENTS;


-- 16. get me maximum salary of IT_PROG
SELECT MAX(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- minimum salary of SA_REP
SELECT MIN(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'SA_REP';

-- total salary of ST_MAN
SELECT SUM(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN';

-- average salary of ST_CLERK
SELECT AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID = 'ST_CLERK';

-- average salary of all employee
SELECT AVG(SALARY)
FROM EMPLOYEES;

SELECT ROUND(AVG(SALARY) )
FROM EMPLOYEES;

-- 17. get me all city name uppercase and address losercase
SELECT UPPER(CITY),LOWER(STREET_ADDRESS)
FROM LOCATIONS;

-- 18. get me every job_title length
SELECT  JOB_TITLE, LENGTH(JOB_TITLE)
FROM JOBS;

--GET ME FIRST_NAME + LAST_NAME
SELECT FIRST_NAME || ' ' || EMPLOYEES.LAST_NAME AS FULL_NAME
FROM EMPLOYEES;

-------GROUP BY--------------------
-- 19. get me maximum salary of each department_id
SELECT  DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 20. get me how many employees in each job_id
SELECT JOB_ID,COUNT(JOB_ID)
FROM EMPLOYEES
GROUP BY JOB_ID;

-- 21. get me salary information( min, max, sum, avg) of each job_id
SELECT JOB_ID, MIN(SALARY), MAX(SALARY), SUM(SALARY), AVG(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

------HAVING-------------------

-- 22. get me job_id that total salary is more than 50000
SELECT JOB_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID
HAVING SUM(SALARY) >5000;

 -- 23. get me department_id who has more than 10 employeE
 SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID) > 10;

SELECT DEPARTMENT_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 10;


-- 24. get me which job_id has AVERAGE commission_pct over 20%
SELECT JOB_ID, AVG(commission_pct)
FROM EMPLOYEES
HAVING AVG(COMMISSION_PCT) >0.2
GROUP BY JOB_ID;

-- 25. get me each manager_id max salary and find our those more than 10000
SELECT MANAGER_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY MANAGER_ID
HAVING MAX(SALARY)>10000;