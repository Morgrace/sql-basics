-- NEW: ISNULL(value,replacement_value) replace null with a specific value
-- NEW COALESCE(value1,value2,value3...) return the first non null value from a list
USE SalesDB
SELECT
    CustomerID,
    Score,
    AVG(Score) OVER () AvgScores,
    AVG(COALESCE(Score, 0)) OVER () AvgScores2
FROM
    Sales.Customers;

SELECT
    CONCAT (FirstName, ' ', LastName) FullName,
    COALESCE(Score, 0) + 10 ScoreWithBonus
FROM
    Sales.Customers;

SELECT
    CustomerID,
    Score,
    CASE
        WHEN Score IS NULL THEN 1
        ELSE 0
    END Flag
FROM
    Sales.Customers
ORDER BY
    Flag,
    Score;

-- NEW: NULLIF(value1,value2)
SELECT
    OrderID,
    Sales,
    Quantity,
    Sales / NULLIF(Quantity, 0) AS Price
FROM
    Sales.Orders;

SELECT
    C.CustomerID,
    CONCAT (C.FirstName, ' ', C.LastName) AS FullName,
    O.OrderID
FROM
    Sales.Customers C
    LEFT JOIN Sales.Orders O ON C.CustomerID = O.CustomerID
WHERE
    O.OrderID IS NULL;