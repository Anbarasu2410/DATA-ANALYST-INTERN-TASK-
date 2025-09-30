
USE AdventureWorks2022;

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

USE AdventureWorks;
GO

SELECT DISTINCT YEAR(OrderDate) AS OrderYear
FROM Sales.SalesOrderHeader
ORDER BY OrderYear;

SELECT DISTINCT MONTH(OrderDate) AS OrderMonth
FROM Sales.SalesOrderHeader
ORDER BY OrderMonth;

SELECT SUM(TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader;

SELECT COUNT(DISTINCT SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader;


SELECT 
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalDue) AS TotalRevenue,
    COUNT(DISTINCT SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate);


SELECT 
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalDue) AS TotalRevenue,
    COUNT(DISTINCT SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;

SELECT 
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth,
    SUM(TotalDue) AS TotalRevenue,
    COUNT(DISTINCT SalesOrderID) AS TotalOrders
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2013-01-01' AND '2013-06-30'
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY OrderYear, OrderMonth;
