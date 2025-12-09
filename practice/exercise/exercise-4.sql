-- Exercise 1: Product Performance & Inventory Analysis (Hard)
-- Business Question: Management wants to identify which product categories are underperforming and potentially overstocked.
-- Your Task:
-- Find all product categories where:
-- The average list price is greater than $500
-- Total quantity of products in that category (across all products) is less than 100
-- There are at least 3 different products in the category
-- Display: Category name, number of products, average list price, total quantity available, and the name of the most expensive product in each category.
-- Sort by average list price descending.
-- Tables you'll need:
-- SalesLT.Product
-- SalesLT.ProductCategory
-- USE AdventureWorksDW2022
-- SELECT
--     TOP 4 *
-- FROM
--     DimCustomer
-- SELECT
--     TOP 4 *
-- FROM
--     FactInternetSales
-- SELECT
--     TOP 5 C.FirstName + ' ' + C.LastName AS FullName,
--     S.SalesAmount,
--     S.SalesOrderNumber
-- FROM
--     DimCustomer C
--     INNER JOIN FactInternetSales S ON C.CustomerKey = S.CustomerKey
-- SELECT
--     C.FirstName + ' ' + C.LastName AS FullName,
--     S.SalesAmount,
--     S.SalesOrderNumber
-- FROM
--     DimCustomer C
--     LEFT JOIN FactInternetSales S ON C.CustomerKey = S.CustomerKey
USE AdventureWorksLT2022
SELECT
    SC.Name AS ProductCategoryName,
    AVG(SP.ListPrice) AS AverageListPrice,
    COUNT(SP.ProductCategoryID) AS Quantity,
    MAX(SP.ListPrice) AS MostExpensive
FROM
    SalesLT.Product SP
    INNER JOIN SalesLT.ProductCategory SC ON SP.ProductCategoryID = SC.ProductCategoryID
GROUP BY
    SC.Name
HAVING
    AVG(SP.ListPrice) > 500
    AND COUNT(SC.ProductCategoryID) < 100
    AND COUNT(SC.ProductCategoryID) > 3