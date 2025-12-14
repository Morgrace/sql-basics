-- TODO 🎯 EXERCISE 2: Order Status Tracking API ⭐⭐⭐
-- Backend Scenario: Build an order tracking system showing processing times.
-- Table: FactInternetSales
-- Requirements:

-- Calculate days between OrderDate and ShipDate for each order
-- Use CASE to categorize shipping speed:

-- 'Express' if shipped in 0-2 days
-- 'Standard' if shipped in 3-5 days
-- 'Delayed' if shipped in 6+ days
-- 'Not Shipped' if ShipDate is NULL


-- Format OrderDate as 'Mon DD, YYYY' (e.g., 'Jan 15, 2013')
-- Calculate the average shipping days using window function AVG() OVER()
-- Show only orders from 2013
-- Order by OrderDate DESC (newest first)

-- Expected Columns:
-- SalesOrderNumber | FormattedOrderDate | DaysToShip | 
-- ShippingSpeed | AvgShippingDays | SalesAmount

USE AdventureWorksDW2022
SELECT
SalesOrderNumber,
    FORMAT(OrderDate, 'MMM dd yyyy') AS FormattedOrderDate,
    ShipDate,
    DATEDIFF (day, OrderDate, ShipDate) AS DaysToShip,
    CASE
        WHEN DATEDIFF (day, OrderDate, ShipDate) BETWEEN 0 AND 2 THEN 'Express'
        WHEN DATEDIFF (day, OrderDate, ShipDate) BETWEEN 3 AND 5 THEN 'Standard'
        WHEN DATEDIFF (day, OrderDate, ShipDate) > 5 THEN 'Delayed' ELSE 'Not Shipped'
    END AS ShippingSpeed,
    AVG(DATEDIFF (day, OrderDate, ShipDate)) OVER() AS AvgShippingDays,
    SalesAmount
FROM
    FactInternetSales
    WHERE DATEPART(year,OrderDate) >= 2013
ORDER BY OrderDate DESC;