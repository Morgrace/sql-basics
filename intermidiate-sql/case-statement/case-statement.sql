-- IDEA MAIN USE OF CASE -- is for data transformation
-- CASE STATEMENTS IS USED FOR CATEGORIZING DATA
USE SalesDB
-- TODO: Create report showing total sales for each of the following categories: Hight (sales over 50), Medium (Sales 20-50), and low (sales 20 or less) sort the categories from the highest sales to lowest
SELECT
    Category,
    SUM(Sales) AS TotalSales
FROM
    (
        SELECT
            OrderID,
            Sales,
            CASE
                WHEN Sales > 50 THEN 'High'
                WHEN Sales > 20 THEN 'Medium'
                ELSE 'Low'
            END Category
        FROM
            Sales.Orders
    ) t
GROUP BY
    Category
ORDER BY
    TotalSales DESC;

-- TODO Retrieve employee details with gender displayed as full text
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Gender,
    CASE
        WHEN Gender = 'M' THEN 'Male'
        WHEN Gender = 'F' THEN 'Female'
        ELSE 'Not Availble'
    END GenderFullText
FROM
    Sales.Employees;

-- TODO Find the average scores of customers and treat Nulls as 0 and additionally provide details such as CustomerID & LastName
SELECT
    *
FROM
    Sales.Customers;

-- TODO Count how many times each customer has made an order with sales greather than 30
SELECT
    CustomerID,
    SUM(
        CASE
            WHEN Sales > 30 THEN 1
            ELSE 0
        END
    ) TotalOrdersHighSales,
    COUNT(CustomerID) NumberOfOrders
FROM
    Sales.Orders
GROUP BY
    CustomerID