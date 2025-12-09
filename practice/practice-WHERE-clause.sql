-- Exercise 1: Advanced Customer Filtering (WHERE Mastery)
-- Scenario: Marketing wants a specific customer segment for a targeted campaign.
-- Your Task:
-- Find all customers who meet ALL these conditions:
-- Their FirstName starts with 'J' OR 'K'
-- Their YearlyIncome is between $50,000 and $80,000
-- They own a house (HouseOwnerFlag = 1)
-- They have at least 2 cars (NumberCarsOwned >= 2)
-- Their EmailAddress is NOT NULL
-- Their MaritalStatus is 'M' (Married)
-- They have made their first purchase (DateFirstPurchase) in the year 2013
-- Display: CustomerKey, FirstName, LastName, YearlyIncome, NumberCarsOwned, DateFirstPurchase
-- Sort by: YearlyIncome DESC, then LastName ASC
USE AdventureWorksDW2022
SELECT
    CustomerKey,
    FirstName,
    LastName,
    YearlyIncome,
    NumberCarsOwned,
    DateFirstPurchase
FROM
    DimCustomer
WHERE
    (
        FirstName LIKE 'J%'
        OR FirstName LIKE 'K%'
    )
    AND YearlyIncome >= 50000
    AND YearlyIncome <= 80000
    AND NumberCarsOwned >= 2
    AND EmailAddress IS NOT NULL
    AND MaritalStatus = 'M'
    AND DateFirstPurchase >= '2013-01-01'
    AND DateFirstPurchase < '2014-01-01'
ORDER BY
    YearlyIncome DESC,
    LastName ASC;