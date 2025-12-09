-- Exercise 4: Product Inventory Gaps (LEFT JOIN Challenge)
-- Scenario: Warehouse management needs to identify products with potential issues.
-- Your Task - Part A:
-- Find all products that exist in DimProduct but have NEVER appeared in any internet sales (FactInternetSales).
-- Display: ProductKey, EnglishProductName, ListPrice, Color
-- Sort by: ListPrice DESC
-- Hint: Use LEFT JOIN from DimProduct to FactInternetSales, then WHERE FactInternetSales.ProductKey IS NULL
-- Part B:
-- Find products that have been sold but have NO subcategory assigned (ProductSubcategoryKey IS NULL in DimProduct).
-- Display: ProductKey, EnglishProductName, Total Sales Amount
USE AdventureWorksDW2022
SELECT
    P.ProductKey,
    P.EnglishProductName,
    P.ListPrice,
    P.Color
FROM
    DimProduct P
    LEFT JOIN FactInternetSales Sales ON P.ProductKey = Sales.ProductKey
WHERE
    Sales.ProductKey IS NULL
ORDER BY
    P.ListPrice;

-- NOTE PART B
SELECT
    P.ProductKey,
    P.EnglishProductName,
    Sales.TotalProductCost,
    Sales.ShipDate,
    P.ProductSubcategoryKey
FROM
    DimProduct P
    LEFT JOIN FactInternetSales Sales ON P.ProductKey = Sales.ProductKey
WHERE
    Sales.ShipDate IS NOT NULL
    AND P.ProductSubcategoryKey IS NULL