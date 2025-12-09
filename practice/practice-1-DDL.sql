TODO -- Exercise 1: Building a Customer Feedback System (DDL + DML)
-- Scenario: Your company wants to track customer product reviews.
-- Part A - DDL (Create the structure):
-- Create a table called ProductReviews with these columns:
-- ReviewID (INT, NOT NULL, Primary Key)
-- CustomerID (INT, NOT NULL)
-- ProductID (INT, NOT NULL)
-- Rating (INT, NOT NULL) -- scale of 1-5
-- ReviewText (VARCHAR(500))
-- ReviewDate (DATE, NOT NULL)
-- After creating it, you realize you forgot the reviewer's email! Add an Email column (VARCHAR(100), NOT NULL)
-- Management decides they don't need ReviewText anymore (too much data). Remove that column.
-- Part B - DML (Work with the data):
-- Insert 3 sample reviews:
-- ReviewID: 1, CustomerID: 29485, ProductID: 707, Rating: 5, ReviewDate: '2008-06-15', Email: 'john@email.com'
-- ReviewID: 2, CustomerID: 29486, ProductID: 708, Rating: 3, ReviewDate: '2008-06-16', Email: 'sarah@email.com'
-- ReviewID: 3, CustomerID: 29487, ProductID: 707, Rating: 4, ReviewDate: '2008-06-17', Email: 'mike@email.com'
-- Oh no! Customer 29485 changed their rating from 5 to 4. Update their review.
-- Customer 29487 requested their review be deleted for privacy reasons. Delete their review.
-- Verify your final data with a SELECT statement showing all remaining reviews.
USE AdventureWorksLT2022
-- NOTE CREATE TABLE
CREATE TABLE
    ProductReviews (
        ReviewID INT NOT NULL,
        CustomerID INT NOT NULL,
        ProductID INT NOT NULL,
        Rating INT NOT NULL,
        ReviewText VARCHAR(500),
        ReviewDate DATE NOT NULL,
        CONSTRAINT PK_ReviewID PRIMARY KEY (ReviewID),
        CONSTRAINT CHK_Rating CHECK (
            Rating >= 1
            AND Rating <= 5
        )
    )
    -- NOTE ADD COLUMN TO EXISITNG TABLE
ALTER TABLE ProductReviews ADD Email VARCHAR(100) NOT NULL
-- NOTE INSERT INTO TABLE COLUMNS
ALTER TABLE ProductReviews
DROP COLUMN ReviewText
INSERT INTO
    ProductReviews (
        ReviewID,
        CustomerID,
        ProductID,
        Rating,
        ReviewDate,
        Email
    )
VALUES
    (1, 29485, 707, 5, '2008-06-15', 'john@email.com'),
    (2, 29486, 708, 3, '2008-06-16', 'sarah@email.com'),
    (3, 29487, 707, 4, '2008-06-17', 'mike@email.com')
    --NOTE UPDATE Rating COLUMN
UPDATE ProductReviews
SET
    Rating = 4
WHERE
    CustomerID = 29485
    -- NOTE DELETING Review ROW
DELETE FROM ProductReviews
WHERE
    CustomerID = 29487
SELECT
    *
FROM
    ProductReviews