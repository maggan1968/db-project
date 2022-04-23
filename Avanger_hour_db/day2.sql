
-- 1. get me first 10 result of first_name and job_id.
SELECT FIRST_NAME,JOB_ID
FROM EMPLOYEES
    WHERE ROWNUM <=10;

-- 2. get me all employees whose salary is lower than average
SELECT AVG(SALARY)FROM EMPLOYEES;

SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY< (SELECT AVG(SALARY)FROM EMPLOYEES);

-- 3. get me those departments whose employees more than department 80
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

SELECT DEPARTMENT_ID
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID) > (SELECT COUNT(DEPARTMENT_ID)
                              FROM EMPLOYEES
                             WHERE DEPARTMENT_ID = 100);

-- 4. get me those employees who is older than any IT programmer in the company
SELECT MIN(HIRE_DATE)
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

SELECT FIRST_NAME,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE < (SELECT MIN(HIRE_DATE)FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG');

-- 5. get me first name and department name in same table
SELECT FIRST_NAME,DEPARTMENT_NAME
FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 6. get me job id and manager id in one table
SELECT JOB_ID,DEPARTMENTS.MANAGER_ID
FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

-- 7. get me department names and end date( if any employee quit)
SELECT DEPARTMENT_NAME, END_DATE
FROM DEPARTMENTS
INNER JOIN JOB_HISTORY JH on DEPARTMENTS.DEPARTMENT_ID = JH.DEPARTMENT_ID;
----SAME--
SELECT DEPARTMENT_NAME, END_DATE
FROM DEPARTMENTS
LEFT OUTER JOIN JOB_HISTORY JH on DEPARTMENTS.DEPARTMENT_ID = JH.DEPARTMENT_ID;


-- 8. get me job id and job title together
SELECT JOB_ID, JOB_TITLE
FROM EMPLOYEES
LEFT OUTER JOIN JOBS
ON EMPLOYEES.JOB_ID = JOBS.JOB_ID;

-- 9. get me first name who left the company
SELECT FIRST_NAME,END_DATE
FROM EMPLOYEES
RIGHT OUTER JOIN JOB_HISTORY
ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

-- 10. get me first name and job title for those whose salary is equal to max salary of that job  title
SELECT FIRST_NAME,SALARY,JOB_TITLE,MAX_SALARY
FROM EMPLOYEES
RIGHT OUTER JOIN JOBS
ON EMPLOYEES.SALARY=JOBS.MAX_SALARY;

-- 11.get me department name, city in same table
SELECT DEPARTMENT_NAME,CITY
FROM DEPARTMENTS
FULL JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

-- 12. get me first name , start date, end date in same table
SELECT FIRST_NAME,START_DATE,END_DATE
FROM EMPLOYEES
FULL JOIN JOB_HISTORY
ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;

--UNION---

-- 13. create a table name laptops, with id, brand, color, price
CREATE TABLE laptops (
                         Id_number integer primary key ,
                         brand varchar(25),
                         color varchar(25),
                         price integer
);
SELECT *
FROM LAPTOPS;

insert into laptops values (1, 'hp', 'black', 1500);
insert into laptops values (2, 'msi', 'grey', 1300);
insert into laptops values (3, 'dell', 'red', 1600);
insert into laptops values (4, 'hp', 'white', 1300);
insert into laptops values (5, 'macbook', 'white', 1800);

-- 14. create table phones with id, brand, color, price
CREATE TABLE  PHONES(
                       id_number integer primary key ,
                       brand varchar(25),
                       color varchar(25),
                       price integer
);
select * from phones;

insert into phones values (1, 'samsung', 'black', 700);
insert into phones values (2, 'dell', 'grey', 1000);
insert into phones values (3, 'msi', 'black', 800);
insert into phones values (4, 'iphone', 'white', 1100);

-- 15. insert laptops table belwo values
-- 1. (1, 'hp' , 'black', 1500)
-- 2. (2, 'msi', 'grey', 1300)
-- 3. (3, 'dell', 'black', 1600)
-- 4. (4, 'hp', 'white', 1300)
-- 5. (5, 'macbook', 'white', 1800)

insert into laptops values (1, 'hp', 'black', 1500);
insert into laptops values (2, 'msi', 'grey', 1300);
insert into laptops values (3, 'dell', 'red', 1600);
insert into laptops values (4, 'hp', 'white', 1300);
insert into laptops values (5, 'macbook', 'white', 1800);

-- 16. insert phones table belwo values
-- -- 1. (1, 'samsung' , 'black', 700)
-- -- 2. (2, 'dell', 'grey', 1000)
-- -- 3. (3, 'msi', 'black', 800)
-- -- 4. (4, 'iphone', 'white', 1100)

insert into phones values (1, 'samsung', 'black', 700);
insert into phones values (2, 'dell', 'grey', 1000);
insert into phones values (3, 'msi', 'black', 800);
insert into phones values (4, 'iphone', 'white', 1100);

--17. update dell price to 1500
update laptops
set price = 1500
where ID_NUMBER = 3;

select * from laptops;

-- 18. delete macbook from laptops table
delete  from laptops
where ID_NUMBER = 5;

-- 19. combine all brand names in one table( from laptops and phones)
SELECT BRAND FROM LAPTOPS
UNION ALL
SELECT BRAND FROM PHONES;

-- 20. combine unique brand names in one table
SELECT BRAND
FROM LAPTOPS
UNION
SELECT BRAND
FROM PHONES;

-- 21. get me unique prices and sort them
SELECT PRICE
FROM LAPTOPS
UNION
SELECT PRICE
FROM PHONES;

-- 22. get me common colors for phones and laptops
SELECT COLOR
FROM laptops
INTERSECT
SELECT COLOR
FROM PHONES;
-- 23. get me the colors only laptops have
SELECT COLOR
FROM laptops
MINUS
SELECT COLOR
FROM PHONES;

SELECT COLOR
FROM laptops;
SELECT COLOR
FROM PHONES;
-- 24. get me the brands only phones have
SELECT BRAND
FROM PHONES
MINUS
SELECT BRAND
FROM laptops;