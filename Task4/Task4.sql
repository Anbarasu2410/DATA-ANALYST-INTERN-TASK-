CREATE DATABASE EcommerceDB1;


USE EcommerceDB1;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Country VARCHAR(50)
);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Customers (CustomerID, CustomerName, Email, Country)
VALUES
(1, 'Alice', 'alice@example.com', 'USA'),
(2, 'Bob', 'bob@example.com', 'UK'),
(3, 'Charlie', 'charlie@example.com', 'India');

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(101, 'Laptop', 'Electronics', 1200.00),
(102, 'Phone', 'Electronics', 800.00),
(103, 'Headphones', 'Accessories', 150.00);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1001, 1, '2025-09-20', 1950.00),
(1002, 2, '2025-09-21', 800.00);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1001, 101, 1),   -- Laptop for Alice
(2, 1001, 102, 1),   -- Phone for Alice
(3, 1002, 102, 1);   -- Phone for Bob

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

SELECT * 
FROM Customers
WHERE Country = 'USA';

SELECT * FROM Customers
WHERE Country LIKE '__a';



SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

-- Total sales per customer
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- Average product price per category
SELECT Category, AVG(Price) AS AvgPrice
FROM Products
GROUP BY Category;


-- Get order details with customer and product info
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity, p.Price
FROM OrderDetails od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Products p ON od.ProductID = p.ProductID;

-- Left join example: customers with or without orders
SELECT c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- Customers who spent more than the average
SELECT CustomerID, TotalAmount
FROM Orders
WHERE TotalAmount > (
    SELECT AVG(TotalAmount) 
    FROM Orders
);
-- View for total order value per customer
CREATE VIEW CustomerOrderSummary AS
SELECT c.CustomerID, c.CustomerName, SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;
-- Query the view
SELECT * FROM CustomerOrderSummary;

-- Index on Orders table for faster customer queries
CREATE INDEX idx_customer ON Orders(CustomerID);

-- Index on OrderDetails table for faster product queries
CREATE INDEX idx_order_product ON OrderDetails(OrderID, ProductID);
