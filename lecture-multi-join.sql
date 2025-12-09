USE SalesDB
SELECT
    O.OrderID,
    O.Sales,
    C.FirstName AS CustomerFirstName,
    C.LastName AS CustomerLastName,
    P.Product AS ProductName,
    P.Price,
    E.FirstName AS EmployeeFirstName,
    E.LastName AS EmployeeLastName
FROM
    Sales.Orders O
    LEFT JOIN Sales.Customers C ON O.CustomerID = C.CustomerID
    LEFT JOIN Sales.Products P ON O.ProductID = P.ProductID
    LEFT JOIN Sales.Employees E ON O.SalesPersonID = E.EmployeeID