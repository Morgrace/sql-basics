-- Exercise 3: Sales Trend Analysis (Hard)
-- Find the total sales amount for each year and month combination, but only show months where sales exceeded $100,000. Display year, month, total sales, and number of orders. Sort by year and month.
-- Tables you'll need: SalesLT.SalesOrderHeader
-- Hints:
-- Use YEAR() and MONTH() functions on OrderDate
-- Use SUM() for TotalDue
-- Use COUNT() for number of orders
-- GROUP BY year and month
-- HAVING clause for the $100k threshold
USE AdventureWorksLT2022
SELECT
    YEAR (OrderDate) AS YEAR,
    MONTH (OrderDate) AS MONTH,
    SUM(TotalDue) AS TOTAL_SALES,
    COUNT(SalesOrderID) AS NumberOfOrders
FROM
    SalesLT.SalesOrderHeader
GROUP BY
    YEAR (OrderDate),
    MONTH (OrderDate)
HAVING
    SUM(TotalDue) > 100000
ORDER BY
    YEAR,
    MONTH