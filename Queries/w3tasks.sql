
-- 1. FIND OUT THE CUSTOMER COUNT FOR EACH COUNTRY
-- 2. FIND OUT ANY EMPLOYEES WITH BA DEGREES (BY CHECKING NOTES CONTAINING BA )
-- 3. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
-- 4. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
---SELECT o.OrderID , c.CustomerName
---FROM ORDERS o
---INNER JOIN CUSTOMERS c ON o.CustomerID = c.CustomerID

-- 4. FIND OUT CUSTOMER NAME AND OrderID  Using the Orders and Customers table
-- CONTINUE TO FIND OUT THE EMPLOYEE NAME USING EmployeeID
--SELECT o.OrderID , c.CustomerName, e.FIRSTNAME
--FROM ORDERS o
--         INNER JOIN CUSTOMERS c ON o.CustomerID = c.CustomerID
--         INNER JOIN EMPLOYEES e ON o.EmployeeID = e.EmployeeID


-- 5. Find out OrderDetailID and ProductName using the OrderDetails table and Products table
-- they are related by ProductID

--------OPTIONAL TASK ------
-- O1. FIND OUT HOW MANY ORDERS EACH CUSTOMER MADE, INCLUDING THOSE CUSTOMERS WHO MADE NO ORDER
-- O2. FIND OUT COUNT OF PRODUCTS FOR EACH ORDER FROM OrderDetails table
-- O3.  FIND OUT EMPLOYEE FirstName and Count of ORDER they processed
-- including those employees did not process any order (Adam)

-- O4. Find out How much each ORDER COST - SUM OF ALL PRODUCT PRICE IN ORDER DETAILS FOR EACH ORDER
---SELECT oe.OrderID ,  oe.ProductID, oe.Quantity , p.Price
---FROM OrderDetails oe
---INNER JOIN Products p ON p.ProductID = oe.ProductID
---GROUP BY oe.OrderId