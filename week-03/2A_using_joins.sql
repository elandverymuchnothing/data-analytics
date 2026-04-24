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