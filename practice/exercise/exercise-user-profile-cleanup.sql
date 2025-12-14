--  TODO 🎯 EXERCISE 1: User Profile Cleanup API ⭐⭐
-- Backend Scenario: Your API returns messy customer data. Clean it before sending to frontend.
-- Table: DimCustomer
-- Requirements:

-- Get all customers from English-speaking countries (use EnglishCountryRegionName)
-- Create a FullName column: FirstName + ' ' + LastName (trimmed, no extra spaces)
-- Replace any NULL in MiddleName with empty string ''
-- Create an EmailUsername column: first 3 letters of FirstName + last 4 of LastName (lowercase)
-- Use CASE to categorize customers by YearlyIncome:

-- 'High' if > $75,000
-- 'Medium' if $30,000-$75,000
-- 'Low' if < $30,000
-- 'Unknown' if NULL


-- Show only customers who have an email address

-- Expected Columns:
-- CustomerKey | FullName | CleanMiddleName | EmailUsername | 
-- IncomeCategory | YearlyIncome | EmailAddress

USE AdventureWorksDW2022;

SELECT
    Customer.CustomerKey,
    CONCAT (
        TRIM(Customer.FirstName),
        ' ',
        TRIM(Customer.LastName)
    ) AS FullName,
    COALESCE(Customer.MiddleName, '') AS CleanMiddleName,
    LOWER(
        LEFT (TRIM(Customer.FirstName), 3) + RIGHT (TRIM(Customer.LastName), 4)
    ) AS EmailUsername,
    CASE
        WHEN Customer.YearlyIncome > 75000 THEN 'High'
        WHEN Customer.YearlyIncome BETWEEN 30000 AND  75000 THEN 'Medium'
        WHEN Customer.YearlyIncome < 30000 THEN 'Low'
        ELSE 'Unknown'
    END AS IncomeCategory,
    Customer.YearlyIncome,
    NULLIF(TRIM(Customer.EmailAddress), '') AS EmailAddress
FROM
    DimCustomer Customer
    LEFT JOIN DimGeography Geography ON Customer.GeographyKey = Geography.GeographyKey
WHERE
    Geography.EnglishCountryRegionName NOT IN ('Germany, France')
    AND Customer.EmailAddress IS NOT NULL