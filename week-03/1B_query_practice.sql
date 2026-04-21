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