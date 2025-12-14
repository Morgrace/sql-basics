-- TODO ### **🎯 EXERCISE 1: Historical Data Merge (SET OPERATORS)**
-- **Difficulty: ⭐⭐⭐ HARD**
-- The company archives old sales data into a separate history table. You need to create a complete sales report.
-- **Tables:**
-- - `FactInternetSales` (current sales)
-- - `FactInternetSalesReason` (for filtering)
-- **Requirements:**
-- 1. Get all sales from 2013 and earlier from `FactInternetSales`
-- 2. Get all sales from 2014 onwards from `FactInternetSales`
-- 3. Combine them with a column indicating 'Historical' or 'Current'
-- 4. Include: `SalesOrderNumber`, `OrderDate`, `SalesAmount`, `OrderQuantity`
-- 5. Find sales that exist in BOTH 2013 AND 2014 (same customer, same product)
-- 6. Show sales that happened in 2013 but NOT in 2014
-- **Expected Output Columns:**
-- ```
-- DataSource | SalesOrderNumber | OrderDate | SalesAmount | OrderQuantity
-- ```
USE AdventureWorksDW2022;

SELECT
    CustomerKey,
    ProductKey,
    SalesOrderNumber,
    OrderDate,
    SalesAmount,
    OrderQuantity,
    'Historical' AS Period
FROM
    FactInternetSales
WHERE
    DATEPART (year, OrderDate) <= 2013
UNION
SELECT
    CustomerKey,
    ProductKey,
    SalesOrderNumber,
    OrderDate,
    SalesAmount,
    OrderQuantity,
    'Current' AS Period
FROM
    FactInternetSales
WHERE
    DATEPART (year, OrderDate) >= 2014;

SELECT
    CustomerKey,
    ProductKey,
    -- OrderDate
FROM
    (
        SELECT
            CustomerKey,
            ProductKey,
            SalesOrderNumber,
            OrderDate,
            SalesAmount,
            OrderQuantity,
            'Historical' AS Period
        FROM
            FactInternetSales
        WHERE
            DATEPART (year, OrderDate) <= 2013
        UNION ALL
        SELECT
            CustomerKey,
            ProductKey,
            SalesOrderNumber,
            OrderDate,
            SalesAmount,
            OrderQuantity,
            'Current' AS Period
        FROM
            FactInternetSales
        WHERE
            DATEPART (year, OrderDate) >= 2014
    ) t
WHERE
    YEAR (OrderDate) IN (2014, 2013)
GROUP BY
    CustomerKey,
    ProductKey
ORDER BY
    CustomerKey
    -- NOTE I COULDNT SOLVE THIS