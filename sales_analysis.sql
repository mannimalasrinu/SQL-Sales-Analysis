USE StudentDB;

DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Create Tables --

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT
);

CREATE TABLE Sales(
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);

-- Insert Data --

INSERT INTO Customers VALUES
(1,'Ravi','Hyderabad'),
(2,'Srinu','Vijayawada'),
(3,'Kiran','Guntur'),
(4,'Anil','Hyderabad'),
(5,'Sai','Visakhapatnam');
INSERT INTO Products VALUES
(101,'Laptop','Electronics',50000),
(102,'Mobile','Electronics',20000),
(103,'Headphones','Accessories',3000),
(104,'Keyboard','Accessories',1500),
(105,'Monitor','Electronics',12000);
INSERT INTO Sales VALUES
(1,1,101,1),
(2,2,102,2),
(3,3,103,3),
(4,1,104,2),
(5,4,105,1),
(6,5,102,1),
(7,2,101,1),
(8,3,104,4);

-- Verify Data --

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Sales;
-- Customer + Product Details --

SELECT
    Customers.customer_name,
    Products.product_name,
    Sales.quantity
FROM Sales
INNER JOIN Customers
ON Sales.customer_id = Customers.customer_id
INNER JOIN Products
ON Sales.product_id = Products.product_id;

-- Revenue for Each Sale

SELECT
    Products.product_name,
    Products.price,
    Sales.quantity,
    Products.price * Sales.quantity AS Revenue
FROM Sales
INNER JOIN Products
ON Sales.product_id = Products.product_id;

-- Total Revenue

SELECT
    SUM(Products.price * Sales.quantity) AS Total_Revenue
FROM Sales
INNER JOIN Products
ON Sales.product_id = Products.product_id;

-- Top Selling Products

SELECT
    Products.product_name,
    SUM(Sales.quantity) AS Total_Quantity
FROM Sales
INNER JOIN Products
ON Sales.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY Total_Quantity DESC;

-- Customer-wise Purchase Quantity

SELECT
    Customers.customer_name,
    SUM(Sales.quantity) AS Total_Items
FROM Sales
INNER JOIN Customers
ON Sales.customer_id = Customers.customer_id
GROUP BY Customers.customer_name
ORDER BY Total_Items DESC;

-- City-wise Customer Count

SELECT
    city,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY city;

-- Revenue by Product

SELECT
    Products.product_name,
    SUM(Products.price * Sales.quantity) AS Revenue
FROM Sales
INNER JOIN Products
ON Sales.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY Revenue DESC;

-- Highest Revenue Product

SELECT TOP 1
    Products.product_name,
    SUM(Products.price * Sales.quantity) AS Revenue
FROM Sales
INNER JOIN Products
ON Sales.product_id = Products.product_id
GROUP BY Products.product_name
ORDER BY Revenue DESC;

-- Average Product Price

SELECT
    AVG(price) AS Average_Price
FROM Products;

-- Most Expensive Product

SELECT
    product_name,
    price
FROM Products
WHERE price = (
    SELECT MAX(price)
    FROM Products
);
