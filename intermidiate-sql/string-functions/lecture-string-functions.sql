--we have single row functions and multi row functins
-- functions can be nested
USE MyDatabase
SELECT
    first_name,
    country,
    CONCAT (first_name, ' ', country) AS name_country
FROM
    customers;

--  NOTE FINDING values that have whitespaces or trailing white space
SELECT
    first_name
FROM
    customers
WHERE
    first_name != TRIM(first_name)
    -- NOTE REPLACE
SELECT
    '123-345-7890' AS Phone,
    REPLACE ('123-345-7890', '-', '') AS clean_phone;

-- NOTE LEN()
-- NOTE LEFT() & RIGHT()
SELECT
    first_name,
    LEFT (TRIM(first_name), 2) first_2_char,
    RIGHT (first_name, 2) last_2_char
FROM
    customers
    -- NOTE SUBSTRING(value,start,length)
SELECT
    first_name,
    SUBSTRING(TRIM(first_name), 2, LEN (first_name)) AS mutulated_name
FROM
    customers;

-- NUMBER FUNTIONS
-- NOTE ROUND(value,decimalPlace)
SELECT
    3.516,
    ROUND(3.516, 2)
    -- ABS()