-- TODO Exercise 2: Employee Department Transfer (DML Focus)
-- Scenario: You're managing employee data and need to handle department changes.
-- Setup - Create the tables first:
-- sqlCREATE TABLE Departments (
--     DeptID INT NOT NULL,
--     DeptName VARCHAR(50) NOT NULL,
--     CONSTRAINT pk_departments PRIMARY KEY (DeptID)
-- )
-- CREATE TABLE Employees (
--     EmployeeID INT NOT NULL,
--     FullName VARCHAR(100) NOT NULL,
--     DeptID INT,
--     Salary DECIMAL(10,2),
--     CONSTRAINT pk_employees PRIMARY KEY (EmployeeID)
-- )
-- Your Tasks:
-- Insert 3 departments:
-- (1, 'Sales')
-- (2, 'IT')
-- (3, 'HR')
-- Insert 5 employees:
-- (101, 'Alice Johnson', 1, 50000)
-- (102, 'Bob Smith', 1, 55000)
-- (103, 'Carol White', 2, 65000)
-- (104, 'David Brown', 2, 70000)
-- (105, 'Eve Davis', NULL, 45000) -- Not assigned yet
-- Eve Davis just got assigned to HR. Update her record to set DeptID = 3
-- Everyone in Sales (DeptID = 1) gets a 10% raise! Update their salaries accordingly.
-- Bob Smith (EmployeeID 102) left the company. Delete his record.
-- Copy all IT department employees (DeptID = 2) into a new table called ITEmployeesBackup (create the table structure yourself first, then insert the data)
-- Display all employees with their department names (you'll need a JOIN for verification)
USE AdventureWorksLT2022
CREATE TABLE
    ITEmplyeesBackup (
        EmployeeID INT NOT NULL,
        FullName VARCHAR(100) NOT NULL,
        DeptID INT,
        Salary DECIMAL(10, 2),
        CONSTRAINT pk_employees_backup PRIMARY KEY (EmployeeID)
    )
CREATE TABLE
    Departments (
        DeptID INT NOT NULL,
        DeptName VARCHAR(50) NOT NULL,
        CONSTRAINT pk_departments PRIMARY KEY (DeptID)
    )
CREATE TABLE
    Employees (
        EmployeeID INT NOT NULL,
        FullName VARCHAR(100) NOT NULL,
        DeptID INT,
        Salary DECIMAL(10, 2),
        CONSTRAINT pk_employees PRIMARY KEY (EmployeeID)
    )
    -- INSERT INTO Departments
INSERT INTO
    Departments (DeptID, DeptName)
VALUES
    (1, 'Sales'),
    (2, 'IT'),
    (3, 'HR')
    -- INSERT INTO Employees
INSERT INTO
    Employees (EmployeeID, FullName, DeptID, Salary)
VALUES
    (101, 'Alice Johnson', 1, 50000),
    (102, 'Bob Smith', 1, 55000),
    (103, 'Carol White', 2, 65000),
    (104, 'David Brown', 2, 70000),
    (105, 'Eve Davis', NULL, 45000)
    -- UPDATE Employees
UPDATE Employees
SET
    DeptID = 3
WHERE
    EmployeeID = 105
    -- UPDATE Employees-- increase salary in sales dept
UPDATE Employees
SET
    Salary = Salary + (10.0 / 100 * Salary)
WHERE
    DeptID = 1
    -- DELETE RECORD
DELETE FROM Employees
WHERE
    EmployeeID = 102
    -- COPY FROM ONE TABLE TO ANOTHER
INSERT INTO
    ITEmplyeesBackup
SELECT
    *
FROM
    Employees
WHERE
    DeptID = 2
SELECT
    *
FROM
    Employees E
    LEFT JOIN Departments D ON E.DeptID = D.DeptID