USE northwind
-- Below write a query to list the product id
;
SELECT ProductID, ProductName, UnitPrice
FROM products;

SELECT ProductID, ProductName, UnitPrice
FROM products
WHERE UnitPrice <= 7.50;

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM products
WHERE UnitsInStock = 0
  AND UnitsOnOrder >= 1;
  
  -- In the northwind products table items sold is identified by ProductID, ProductName & CategoryID. A list of all Categories can be found in the Categories table. Create a list of all the seafood Items carried.
  
SELECT ProductID, ProductName, CategoryID
FROM products;
  
SELECT CategoryID, CategoryName
FROM categories;

SELECT ProductID, ProductName, UnitPrice
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Seafood';

-- Examine the products table again. How do you know what supplier each product comes from? Where can you find info on suppliers? Write a set of queries to find the specific identifier for "Tokyo Traders" and then find all products from that supplier. 

SELECT ProductID, ProductName, SupplierID
FROM Products;

SELECT SupplierID, CompanyName
FROM Suppliers;

SELECT SupplierID, CompanyName
FROM Suppliers
WHERE CompanyName = 'Tokyo Traders';

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE SupplierID = (
    SELECT SupplierID
    FROM Suppliers
    WHERE CompanyName = 'Tokyo Traders'
);

-- How many employees work at northwind? What employees have "manager" somewhere in their job title? Write queries to answer each question.

SELECT COUNT(*) AS NumberOfEmployees
FROM Employees;

SELECT EmployeeID, FirstName, LastName, Title
FROM Employees
WHERE Title LIKE '%manager%';

-- Write a query to list the product id, product name, and unit price of every product. This time, display them in ascending order by price.

SELECT ProductID, ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice ASC;

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price.

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC;

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price. If two or more have the same price, list those in ascending order by product name.

SELECT ProductID, ProductName, UnitPrice
FROM Products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC, ProductName ASC;

-- Write a query against the orders table that displays the total number of distinct customers who have placed orders, based on customer ID. Use an alias to label the count calculation as CustomerCount.

SELECT COUNT(DISTINCT CustomerID) AS CustomerCount
FROM Orders;

-- Write a query against the orders table that displays the total number of distinct customers who have placed orders, by customer ID, for each country where orders have been shipped. Again, use an alias to label the count as CustomerCount. Order the list by the CustomerCount, largest to smallest.

SELECT ShipCountry,
       COUNT(DISTINCT CustomerID) AS CustomerCount
FROM Orders
GROUP BY ShipCountry
ORDER BY CustomerCount DESC;

-- What are the products that we carry where we have less than 25 units on hand, but 1 or more units of them are on order? Write a query that orders them by quantity on order (high to low), then by product name.

SELECT ProductID, ProductName, UnitsInStock, UnitsOnOrder
FROM Products
WHERE UnitsInStock < 25
  AND UnitsOnOrder >= 1
ORDER BY UnitsOnOrder DESC, ProductName ASC;

-- Write a query to list each of the job titles in employees, along with a count of how many employees hold each job title.

SELECT Title, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Title;

-- What employees have a monthly salary that is between $2000 and $2500? Write a query that orders them by job title.

SELECT EmployeeID, FirstName, LastName, Title, Salary
FROM Employees
WHERE Salary BETWEEN 2000 AND 2500
ORDER BY Title;