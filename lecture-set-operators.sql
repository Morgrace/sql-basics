-- NOTEUSING  UNION OPERATOR; RULE:1. THE NUMBER OF COLUMNS IN THE FIRST AND SECOND QUERIES MUST BE THE SAME
-- 2. RULE 2: MATCHING COUMNS MUST BE OF A COMPATIBLE DATA TYPE
USE SalesDB
-- UNION -- REMOVES DUPLICATES IN ROWS
SELECT
    FirstName,
    LastName
FROM
    Sales.Customers
UNION
SELECT
    FirstName,
    LastName
FROM
    Sales.Employees;

-- NOTE UNION ALL -- DOES NOT REMOVE DUPLICATES IN ROWS
SELECT
    FirstName,
    LastName
FROM
    Sales.Customers
UNION ALL
SELECT
    FirstName,
    LastName
FROM
    Sales.Employees;

-- NOTE EXCEPT  RETURNS DATA FROM THE FIRST QUERY THAT IS NOT IN THE SECOND QUERY
SELECT
    FirstName,
    LastName
FROM
    Sales.Customers
EXCEPT
SELECT
    FirstName,
    LastName
FROM
    Sales.Employees;

-- NOTE INTERSECT RETURNS COMMON VALUES IN BOTH QUERIES
SELECT
    FirstName,
    LastName
FROM
    Sales.Customers
INTERSECT
SELECT
    FirstName,
    LastName
FROM
    Sales.Employees;

-- TODO EXERCISE
SELECT
    'Orders' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM
    Sales.Orders
UNION
SELECT
    'OrdersArchive' AS SourceTable,
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    OrderStatus,
    ShipAddress,
    BillAddress,
    Quantity,
    Sales,
    CreationTime
FROM
    Sales.OrdersArchive;