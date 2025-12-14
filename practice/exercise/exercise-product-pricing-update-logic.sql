-- 🎯 EXERCISE 3: Product Pricing Update Logic ⭐⭐⭐
-- Backend Scenario: Update product prices based on business rules.
-- Table: DimProduct
-- Requirements:

-- Get all products where Status is NULL or empty string (use NULLIF)
-- Calculate a NewPrice:

-- If ListPrice < $100: increase by 10%
-- If ListPrice $100-$500: increase by 5%
-- If ListPrice > $500: no change
-- If ListPrice is NULL: set to $50


-- Use CASE for the logic
-- Calculate the price difference: NewPrice - ListPrice
-- Show product name in format: "Category: ProductName" (use CONCAT)
-- Round all prices to 2 decimal places
-- Show only products with ProductKey < 400

-- Expected Columns:
-- ProductKey | FormattedName | CurrentPrice | NewPrice | 
-- PriceDifference | Status
USE AdventureWorksDW2022
SELECT
ProductKey,
CONCAT(DimProductCategory.EnglishProductCategoryName,':',DimProduct.EnglishProductName) AS FormattedName,
    ListPrice AS CurrentPrice,
    
    CASE
        WHEN ListPrice < 100 THEN ListPrice * 1.1
        WHEN ListPrice BETWEEN 100 AND 500 THEN ListPrice * 1.05
        WHEN ListPrice > 500 THEN ListPrice
        WHEN NULLIF(ListPrice,'') IS NULL THEN 50
    END AS NewPrice,
    (CASE
        WHEN ListPrice < 100 THEN ListPrice * 1.1
        WHEN ListPrice BETWEEN 100 AND 500 THEN ListPrice * 1.05
        WHEN ListPrice > 500 THEN ListPrice
        WHEN NULLIF(ListPrice,'') IS NULL THEN 50
    END - ListPrice) AS PriceDifference, [Status]
    
FROM
    DimProduct
    LEFT JOIN DimProductCategory ON DimProductCategory.ProductCategoryKey = DimProduct.ProductKey
WHERE
    NULLIF(Status, '') IS NULL

-- for joining the dimproduct category and the dim product am not sure which key is the joining key so ... but if the key i used is correct i feel this solves the exercise