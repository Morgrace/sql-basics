-- NOTE WHERE OPERATORS
-- COMPARISOIIN OPERATORS
-- =
-- >
-- >=
-- <
-- <=
-- LOGICAL OPERATORS
-- AND
-- OR
-- NOT
-- RANGE OPERATOR
-- BETWEEN
-- MEMBERSHIP OPERATOR
-- IN
-- NOT IN
-- SEARCH OPERATOR
-- LIKE
USE MyDatabase
SELECT
    *
FROM
    customers
WHERE
    country = 'Germany'
SELECT
    *
FROM
    customers
WHERE
    country != 'Germany'
SELECT
    *
FROM
    customers
WHERE
    score > 500
SELECT
    *
FROM
    customers
WHERE
    score >= 500
SELECT
    *
FROM
    customers
WHERE
    score < 500
SELECT
    *
FROM
    customers
WHERE
    score <= 500
    -- LOGICAL OP
SELECT
    *
FROM
    customers
WHERE
    country = 'USA'
    AND score > 500
SELECT
    *
FROM
    customers
WHERE
    country = 'USA'
    OR score > 500
SELECT
    *
FROM
    customers
WHERE
    NOT score < 500
SELECT
    *
FROM
    customers
WHERE
    score BETWEEN 100 AND 500
SELECT
    *
FROM
    customers
WHERE
    country IN ('Germany', 'USA')
    -- NOTE PATTERN %(ANYTHING) _(EXACTLY)
    -- fistname starts with 'M'
SELECT
    *
FROM
    customers
WHERE
    first_name LIKE 'M%'
    -- firstname ends with 'n
SELECT
    *
FROM
    customers
WHERE
    first_name LIKE '%n'
    -- find all customers whose first name contains 'r'
SELECT
    *
FROM
    customers
WHERE
    first_name LIKE '%r%'
    -- FIND ll customers whose firstname has 'r' in the 3rd position
SELECT
    *
FROM
    customers
WHERE
    first_name LIKE '__r%'