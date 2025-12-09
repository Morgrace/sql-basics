-- Exercise 1: Customer Analysis (Medium)
-- Find the top 5 customers who have placed the most orders, showing their full name, total number of orders, and total amount spent. Order by total amount spent in descending order.
-- NOTE WHEN GROUPING --- GROUP BY THE DUPLICATES AND COUNT THE UNIQUE COLUMN
USE AdventureWorksLT2022
SELECT
    CustomerID,
    SUM(TotalDue) AS TotalAmountSpent,
    COUNT(SalesOrderID) AS TotalNumberOfOrders
FROM
    SalesLt.SalesOrderHeader
GROUP BY
    CustomerID
ORDER BY
    TotalAmountSpent DESC
    -- 
    -- SELECT
    --     COUNT(DISTINCT CustomerID) AS UniqueCustomers
    -- FROM
    --     SalesLt.SalesOrderHeader