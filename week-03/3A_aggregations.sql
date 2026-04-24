-- Create a single query to list the product id, product name, unit price and category name of all products. Order by category name and within that, by product name. 

SELECT ProductID, ProductName, UnitPrice, CategoryName
FROM products
JOIN categories
ON products.categoryid = categories.categoryid
ORDER BY categoryname, productname;

-- Create a single query to list the product id, product name, unit price and supplier name (supplierid?) of all products that cost more than $75. Order by product name.

SELECT products.productid, products.productname, products.unitprice, suppliers.companyname
FROM products
JOIN suppliers
ON products.supplierid = suppliers.supplierid
WHERE products.unitprice > 75
ORDER BY products.productname;

-- Create a single query to list the product id, product name, unit price, category name, and supplier name of every product. Order by product name

SELECT ProductID, ProductName, UnitPrice, CategoryName, CompanyName
FROM Products
JOIN Categories
ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
ORDER BY ProductName;

-- Create a single query to list the order id, ship name, ship address, and shipping company name of every order that shipped to Germany. Assign the shipping company name the alias ‘Shipper.’ Order by the name of the shipper, then the name of who it shipped to

SELECT Orders.OrderID, Orders.ShipName, Orders.ShipAddress, 
       Shippers.CompanyName AS Shipper
FROM Orders
JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipCountry = 'Germany'
ORDER BY Shipper, Orders.ShipName;

-- Start from the same query as above (#4), but omit OrderID and add logic to group by ship name, with a count of how many orders were shipped for that ship name.  

SELECT Orders.ShipName, COUNT(*) AS OrderCount,
       Shippers.CompanyName AS Shipper
FROM Orders
JOIN Shippers
ON Orders.ShipVia = Shippers.ShipperID
WHERE Orders.ShipCountry = 'Germany'
GROUP BY Orders.ShipName, Shippers.CompanyName
ORDER BY Shipper, Orders.ShipName;

-- Create a single query to list the order id, order date, ship name, ship address of all orders that included Sasquatch Ale. ∗ Hint: You will need to join on three tables to accomplish this. (One of these tables has a sneaky space in the name, so you will need to surround it with backticks, like this: `table name`).   

SELECT Orders.OrderID, Orders.OrderDate, Orders.ShipName, Orders.ShipAddress
FROM Orders
JOIN `Order Details`
ON Orders.OrderID = `Order Details`.OrderID
JOIN Products
ON `Order Details`.ProductID = Products.ProductID
WHERE Products.ProductName = 'Sasquatch Ale';

-- Write a query to find the price of the cheapest item that Northwind sells. Then write a second query to find the name of the product that has that price. 

SELECT MIN(UnitPrice) AS CheapestPrice
FROM Products;

SELECT ProductID, ProductName, UnitPrice, QuantityPerUnit, UnitsInStock
FROM Products
WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products);

-- Write a query to find the average price of all items that Northwind sells .Once you have written a working query, try asking Claude or ChatGPT for help using the ROUND function to round the average price to the nearest cent. 

SELECT AVG(UnitPrice) AS AveragePrice
FROM Products;

SELECT ROUND(AVG(UnitPrice), 2) AS AveragePrice
FROM Products;

-- Write a query to find the price of the most expensive item that Northwind sells. Then write a second query to find the name of the product with that price, plus the name of the supplier for that product. 

SELECT MAX(UnitPrice) AS MaxPrice
FROM Products;

SELECT p.ProductName, p.UnitPrice, s.CompanyName
FROM Products p
JOIN Suppliers s
ON p.SupplierID = s.SupplierID
WHERE p.UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

-- Write a query to find total monthly payroll (the sum of all the employees’ monthly salaries). 

SELECT SUM(Salary) AS SumMonthlyPayroll
FROM Employees;

-- Write a query to identify the highest salary and the lowest salary amounts which any employee makes. (Just the amounts, not the specific employees!) 

SELECT MAX(Salary) AS HighestSalary,
       MIN(Salary) AS LowestSalary
FROM Employees;

-- Write a query to find the name and supplier ID of each supplier and the number of items they supply. Hint: Join is your friend here.   

SELECT s.CompanyName, s.SupplierID, COUNT(p.ProductID) AS NumberOfItems
FROM Suppliers s
JOIN Products p
ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName;

-- Write a query to find the list of all category names and the average price for items in each category.  
-- Query showing the Average price as a nearest whole number

SELECT c.CategoryName, ROUND(AVG(p.UnitPrice), 0) AS AveragePrice
FROM Categories c
JOIN Products p
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

-- Write a query to find, for all suppliers that provide at least 5 items to Northwind, what is the name of each supplier and the number of items they supply.

SELECT s.CompanyName, COUNT(p.ProductID) AS NumberOfItems
FROM Suppliers s
JOIN Products p
ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.CompanyName
HAVING COUNT(p.ProductID) >= 5; 

-- Write a query to list products currently in inventory by the product id, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value. If two or more have the same value, order by product name. If a product is not in stock, leave it off the list

SELECT ProductID, ProductName,
       UnitPrice * UnitsInStock AS InventoryValue
FROM Products
WHERE UnitsInStock > 0
ORDER BY InventoryValue DESC, ProductName;