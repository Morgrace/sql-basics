-- Exercise 5: Time-Based Sales Analysis (Pattern Matching + Dates)
-- Scenario: Finance needs quarterly sales breakdowns.
-- Your Task:
-- Analyze sales data to show:
-- Calendar Year (extract from OrderDateKey)
-- Calendar Quarter (you'll need to calculate from month)
-- Total Sales Amount
-- Number of Orders
-- Average Order Value
-- Filtering:
-- Only orders where SalesOrderNumber contains 'SO' (it should start with SO)
-- Only years 2012, 2013, and 2014
-- Exclude any orders where OrderQuantity = 0
-- Sort by: Year ASC, Quarter ASC
-- Tables: FactInternetSales
-- Hints:
-- Extract year: LEFT(CAST(OrderDateKey AS VARCHAR), 4)
-- Extract month: SUBSTRING(CAST(OrderDateKey AS VARCHAR), 5, 2)
-- Calculate quarter: Use CASE statement based on month (1-3=Q1, 4-6=Q2, etc.)
-- Use LIKE for SalesOrderNumber pattern
-- 🎁 BONUS Exercise: Territory Performance (Full JOIN Practice)
-- Find all sales territories from DimSalesTerritory and their corresponding sales performance from FactInternetSales.
-- Show territories even if they have no sales, and sales even if territory info is missing.
-- Display: Territory Name (if exists), Region, Country, Total Sales, Number of Orders
-- Use: FULL OUTER JOIN
USE AdventureWorksDW2022;

SELECT
    DATEPART (
        year,
        CONVERT(DATE, CAST(OrderDateKey AS VARCHAR))
    ) CalendarYear,
    DATEPART (
        quarter,
        CONVERT(DATE, CAST(OrderDateKey AS VARCHAR))
    ) CalendarQuarter,
    SUM(SalesAmount) TotalSalesAmount,
    COUNT(SalesAmount) NrOfOrders,
    AVG(ProductStandardCost) AverageOrderValue
FROM
    FactInternetSales
WHERE
    SalesOrderNumber LIKE 'SO%'
    AND OrderQuantity > 0
GROUP BY
    DATEPART (
        year,
        CONVERT(DATE, CAST(OrderDateKey AS VARCHAR))
    ),
    DATEPART (
        quarter,
        CONVERT(DATE, CAST(OrderDateKey AS VARCHAR))
    )
HAVING
    DATEPART (
        year,
        CONVERT(DATE, CAST(OrderDateKey AS VARCHAR))
    ) IN (2012, 2013, 2014)
ORDER BY
    CalendarYear ASC;

-- BONUS
SELECT
    ST.SalesTerritoryRegion,
    ST.SalesTerritoryCountry,
    SUM(SI.SalesAmount) TotalSales,
    COUNT(SI.SalesAmount) NrOfOrders
FROM
    FactInternetSales SI
    FULL JOIN DimSalesTerritory ST ON SI.SalesTerritoryKey = ST.SalesTerritoryKey
GROUP BY
    ST.SalesTerritoryRegion,
    ST.SalesTerritoryCountry;

SELECT
    *
FROM
    FactInternetSales
    -- NOTE: YOU GOT THE COUNTING WRONG; COUNT SALESORDERNUMBER INSTEAD ADD DISTINCT CLAUSE TO BE ACCURATE