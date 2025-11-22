-- NOTE DATA MANIPULATION LANGUAGE DML
USE MyDatabase
-- INSERT INTO
--     customers (id, first_name, country, score)
-- VALUES
--     (6, 'Anna', 'USA', NULL),
--     (7, 'Sam', NULL, 100)
-- NOTE MOVING DATA FROM ONE TABLE TO ANOTHER TABLE
INSERT INTO
    persons (id, person_name, birth_date, phone)
SELECT
    id,
    first_name,
    NULL,
    'Unknown'
FROM
    customers
    -- NOTE UPDATING THE TABLE
UPDATE customers
SET
    score = 0
WHERE
    id = 6
SELECT
    *
FROM
    customers
UPDATE customers
SET
    score = 30,
    country = 'UK'
WHERE
    id = 7
SELECT
    *
FROM
    customers
WHERE
    SCORE IS NULL
    -- NOTE DELETING 
DELETE FROM customers
WHERE
    id > 5
SELECT
    *
FROM
    customers
WHERE
    Id > 5
    -- NOTE DELETE all data from table persons
    -- you can use DELETE but TRUNCATE is faster as it does not create logs etc
TRUNCATE TABLE persons