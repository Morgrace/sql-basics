-- Exercise 3: Customer Purchase Patterns (Complex WHERE + JOIN)
-- Scenario: Business Intelligence wants to analyze high-value customer behavior.
-- Your Task:
-- Find customers who have:
-- Made purchases totaling more than $5,000 in SalesAmount
-- Placed at least 5 different orders
-- Live in cities that start with 'S' (from DimGeography)
-- Are homeowners (HouseOwnerFlag = 1)
-- Display:
-- Full Name (FirstName + ' ' + LastName)
-- City name
-- Total Amount Spent
-- Number of Orders
-- Average Order Value
-- Sort by: Total Amount Spent DESC
USE AdventureWorksDW2022
SELECT
    CONCAT (C.FirstName, ' ', C.LastName) AS FullName,
    G.City,
    SUM(Sales.TotalProductCost) AS TotalAmountSpent,
    SUM(Sales.OrderQuantity) AS NumberOfOrders,
    AVG(Sales.TotalProductCost) AS AverageOrderValue
FROM
    DimCustomer C
    LEFT JOIN DimGeography G ON C.GeographyKey = G.GeographyKey
    LEFT JOIN FactInternetSales Sales ON C.CustomerKey = Sales.CustomerKey
WHERE
    C.HouseOwnerFlag = 1
GROUP BY
    CONCAT (C.FirstName, ' ', C.LastName),
    G.City
HAVING
    SUM(Sales.TotalProductCost) > 5000
    AND SUM(Sales.OrderQuantity) >= 5
ORDER BY
    TotalAmountSpent ASC;