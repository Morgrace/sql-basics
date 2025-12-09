-- WINDOW FUNCTIONS ALLOW YOU TO PERFORM CALCULATION(E.G AGGREGATION) ON A SPECIFIC SUBSET OF DATA, WITHOUT LOSING THE LEVEL OF DETAILS OF THE ROWS.
-- IT DOES ROW-LEVEL-CALCULATIONS
USE SalesDB
-- NEW WINDOW FUNCTIONs
-- => Aggregate functions =>
-- COUNT(), SUM(), AVG(), MAX(), MIN()
-- 
-- => NEW Rank functions =>
-- ROW_NUMBER(), RANK(), DENSE_RANK(), CUME_DIST(),PERCENT_RANK(),NTILE(n)
-- 
-- => NEW Value (Analytics functins)
-- LEAD(expr,offset,default), LAG(expr,offset,default), FRIST_VALUE(expr), LAST_VALUE(expr)
SELECT
    OrderID,
    OrderDate,
    ProductID,
    OrderStatus,
    Sales,
    SUM(Sales) OVER () TotalSales,
    SUM(Sales) OVER (
        PARTITION BY
            ProductID
    ) TotalSalesByProducts,
    SUM(Sales) OVER (
        PARTITION BY
            ProductID,
            OrderStatus
    ) SalesByProductsAndStatus
FROM
    Sales.Orders;

-- Rank each order based on their sales from the highest to lowest, Additionally provide details such as order id, order date;
SELECT
    OrderID,
    OrderDate,
    Sales,
    RANK() OVER (
        ORDER BY
            Sales DESC
    ) RankSales
FROM
    Sales.Orders
    -- FRAME CLAUSE 
    -- => Frame types - ROWS, RANGE,
    -- 
    -- FRAME BOUNDARY (LOWER VALUE)
    -- => CURRENT ROW, N PRECEDING, UNBOUNDED PRECEDING;
    -- 
    -- FRAME BOUNDARY (Higher value)
    -- =>CURRENT ROW, N FOLLOWING, UNBOUNDED FOLLOWING
SELECT
    OrderID,
    OrderDate,
    OrderStatus,
    Sales,
    SUM(Sales) OVER (
        PARTITION BY
            OrderStatus
        ORDER BY
            OrderDate ROWS BETWEEN CURRENT ROW
            AND 2 FOLLOWING
    ) TotalSales
FROM
    Sales.Orders
    -- TODO: Rank Customers based on their total Sales
SELECT
    CustomerID,
    SUM(Sales) TotalSales,
    RANK() OVER (
        ORDER BY
            SUM(Sales) DESC
    ) RankCustomers
FROM
    Sales.Orders
GROUP BY
    CustomerID