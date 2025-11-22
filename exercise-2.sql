-- Exercise 2: Product Performance (Medium-Hard)
-- Find all product categories where the average product price is greater than $500, but only include products that are currently being sold (SellEndDate IS NULL). Show the category name, number of products, and average price, sorted by average price descending.
-- Tables you'll need: SalesLT.Product, SalesLT.ProductCategory
-- Hints:
-- Use WHERE to filter for active products
-- JOIN Product with ProductCategory
-- GROUP BY category
-- Use HAVING for the average price condition
USE AdventureWorksLT2022
SELECT
    *
FROM
    SalesLT.Product