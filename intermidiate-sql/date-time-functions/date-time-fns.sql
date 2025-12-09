USE SalesDB
-- NOTE DATEPART, DATENAME AND OTHER DATE FUNCTIONS
SELECT
    OrderID,
    CreationTime,
    -- DATETRUNC EXAMPLES
    DATETRUNC (year, CreationTime) Year_dt,
    DATETRUNC (day, CreationTime) Day_dt,
    DATETRUNC (minute, CreationTime) Minute_dt,
    -- DATENAME EXAMPLES -- DATA OUTPUT IS STRING
    DATENAME (year, CreationTime) Year_dn,
    DATENAME (month, CreationTime) Month_dn,
    DATENAME (day, CreationTime) Day_dn,
    DATENAME (hour, CreationTime) Hour_dn,
    DATENAME (quarter, CreationTime) Quarter_dn,
    DATENAME (weekday, CreationTime) Weekday_dn,
    -- DATEPART EXAMPLES -- DATA TYPE IS INT
    DATEPART (year, CreationTime) Year_dp,
    DATEPART (month, CreationTime) Month_dp,
    DATEPART (day, CreationTime) Day_dp,
    DATEPART (hour, CreationTime) Hour_dp,
    DATEPART (quarter, CreationTime) Quarter_dp,
    DATEPART (weekday, CreationTime) Weekday_dp,
    YEAR (CreationTime) Year,
    MONTH (CreationTime) Month,
    DAY (CreationTime) Day
FROM
    Sales.Orders;

-- NOTE USECASE FOR DATETRUNC()
SELECT
    DATETRUNC (month, CreationTime) Creation,
    COUNT(*)
FROM
    Sales.Orders
GROUP BY
    DATETRUNC (month, CreationTime);

--- data type for trunc is DATETIME
-- TODO EXERCISE
SELECT
    YEAR (OrderDate),
    COUNT(*) NrOfOrders
FROM
    Sales.Orders
GROUP BY
    YEAR (OrderDate);

--    TODO exercise
SELECT
    *
FROM
    Sales.Orders
WHERE
    MONTH (OrderDate) = 2
    -- NOTE FORMAT (value,format [,culture(optional)])
SELECT
    OrderID,
    CreationTime,
    FORMAT (CreationTime, 'MM-dd-yyyy') USA_FORMAT,
    FORMAT (CreationTime, 'dd') dd,
    FORMAT (CreationTime, 'ddd') ddd,
    FORMAT (CreationTime, 'dddd') dddd,
    FORMAT (CreationTime, 'MM') MM,
    FORMAT (CreationTime, 'MMM') MMM,
    FORMAT (CreationTime, 'MMMM') MMMM
FROM
    Sales.Orders;

SELECT
    OrderID,
    CreationTime,
    'Day ' + FORMAT (CreationTime, 'ddd MMM') + ' Q' + DATENAME (quarter, CreationTime) + ' ' + FORMAT (CreationTime, 'yyyy hh:mm:ss tt') CustomFormat
FROM
    Sales.Orders;

    -- NOTE CONVERT()
    SELECT CreationTime,
     CONVERT(DATE, CreationTime) AS [Datetime to Date CONVERT],
     CONVERT(VARCHAR, CreationTime, 32) AS [USA Std. Style:32] 
     FROM Sales.Orders

    --  NOTE CAST(value AS data_type)
    SELECT CAST('123' AS INT) AS [String to Int],
    CAST(123 AS VARCHAR) AS [Int to String],
    CAST('2025-08-20' AS DATETIME2) AS [String to Datetime],
    CreationTime,
    CAST(CreationTime AS DATE) AS [Datetime to Date]
    FROM Sales.Orders;

    -- NOTE DATEADD(part,interval,date)
SELECT 
    OrderID, OrderDate, 
    DATEADD(month,3,OrderDate) AS ThreeMonthsLater, 
    DATEADD(year,2,OrderDate) AS TwoYearsLater 
FROM Sales.Orders

-- NOTE DATEDIFF(part, start_date, end_date)
SELECT 
    EmployeeID,
    BirthDate,
    DATEDIFF(year,BirthDate,GETDATE()) Age 
FROM 
    Sales.Employees

-- TODO exercise
SELECT 
    OrderID, 
    OrderDate,
    ShipDate, 
    DATEDIFF(day,OrderDate,ShipDate) Day2Ship,
    AVG(DATEDIFF(day,OrderDate,ShipDate)) OVER() AS AvgShippingDate 
FROM 
    Sales.Orders

-- TODO Find the number of days between each order and the previous order
SELECT 
    OrderID,
    OrderDate CurrentOrderDate,
    LAG(OrderDate) OVER(ORDER BY OrderDate) PreviousOrderDate,
    DATEDIFF(day, LAG(OrderDate) OVER(ORDER BY OrderDate), OrderDate) NrOfDays
FROM 
    Sales.Orders

    -- NOTE ISDATE(value)
    SELECT ISDATE('123') DateCheck1
    SELECT ISDATE('2025-08-20') DateCheck2
    SELECT ISDATE('20-09-2025') DateCheck3 -- works when the value is following ISO format

SELECT
    OrderDate,
    CASE WHEN ISDATE(OrderDate) = 1 THEN CAST(OrderDate AS DATE) END NewOrderDate
    FROM 
        (SELECT '2025-08-20' AS OrderDate 
        UNION
        SELECT '2025-08-21'
        UNION
        SELECT '2025-08-23'
        UNION
        SELECT '2025-08') AS AllDates