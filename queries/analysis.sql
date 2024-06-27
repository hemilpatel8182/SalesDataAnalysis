-- queries/analysis.sql
USE SalesDB;

-- Total Sales by Product
SELECT p.ProductName, SUM(s.Total) AS TotalSales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName;

-- Customer Purchase History
SELECT c.Name, p.ProductName, s.SaleDate, s.Quantity, s.Total
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID
ORDER BY c.Name, s.SaleDate;

-- Monthly Sales Report
SELECT DATE_FORMAT(SaleDate, '%Y-%m') AS Month, SUM(Total) AS TotalSales
FROM Sales
GROUP BY Month
ORDER BY Month;
