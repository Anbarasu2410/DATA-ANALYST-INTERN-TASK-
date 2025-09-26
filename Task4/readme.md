
SQL Data Analysis – Ecommerce Database

 Overview
This project demonstrates how to manipulate and analyze structured data using **MS SQL Server**. The goal was to practice SQL queries, joins, subqueries, aggregate functions, views, and query optimization using a sample **Ecommerce database**.

Database Structure
The database contains the following tables:

- **Customers**: Stores customer information (CustomerID, CustomerName, Email, Country)
- **Products**: Stores product details (ProductID, ProductName, Category, Price)
- **Orders**: Stores orders placed by customers (OrderID, CustomerID, OrderDate, TotalAmount)
- **OrderDetails**: Stores details of products in each order (OrderDetailID, OrderID, ProductID, Quantity)

 Key SQL Concepts Implemented
1. SELECT, WHERE, ORDER BY, GROUP BY 
   - Filtering data by country  
   - Sorting products by price  
   - Aggregating total sales per customer  

2. JOINs 
   - INNER JOINs to combine Orders, Customers, Products, and OrderDetails  
   - LEFT JOIN to find customers with or without orders  

3. Subqueries  
   - Identifying customers who spent more than the average  

4. Aggregate Functions  
   - SUM, AVG to calculate totals and averages  

5. Views
   - Created CustomerOrderSummary to summarize total spending per customer  

6. Query Optimization 
   - Created indexes on frequently joined columns to improve query performance  

 Sample Queries

-- Total sales per customer
SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Orders
GROUP BY CustomerID;

 Orders with customer and product details
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity, p.Price
FROM OrderDetails od
INNER JOIN Orders o ON od.OrderID = o.OrderID
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Products p ON od.ProductID = p.ProductID;
