USE MyDatabase
SELECT
    first_name,
    country,
    score
FROM
    customers
    --NOTE INTRODUCING "WHERE" is used to filter data based on a condition
SELECT
    first_name,
    country
FROM
    customers
WHERE
    country = 'Germany'
    --NOTE How to sort data with ORDER BY
SELECT
    *
FROM
    customers
ORDER BY
    score DESC
    -- SORT BY LOWEST SCORE
SELECT
    *
FROM
    customers
ORDER BY
    score ASC
    -- NOTE NESTED SORTING
SELECT
    *
FROM
    customers
ORDER BY
    country ASC,
    score DESC
    -- NOTE GROUP BY -- aggregation of data this here groups by country
SELECT
    country,
    SUM(score) AS total_score
FROM
    customers
GROUP BY
    country
    -- NOTE find the total score and total number of customers for each country
SELECT
    country,
    SUM(score),
    COUNT(id)
FROM
    customers
GROUP BY
    country
    -- FILTERING DATA USING HAVING NOTE CAN ONLY BE USED AFTER USING GROUP BY -- Find the average score for each country considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430
SELECT
    country,
    AVG(score) AS avg_score
FROM
    customers
WHERE
    score != 0
GROUP BY
    country
HAVING
    AVG(score) > 430
    -- DISTINCT REMOVES DUPLICATES FROM DATA; CAN SLOW DOWN YOUR QUERY NOTE IT'S AN EXPENSIVE OPERAION
SELECT DISTINCT
    country
FROM
    customers
    -- NOTE TOP: OR LIMIT RESTRICT THE NUMBER OF ROWS RETURNED IN THE RESULT
SELECT
    TOP 2 *
FROM
    customers
ORDER BY
    score ASC
    --  GET THE TOW MOST RECENT ORDERS
SELECT
    TOP 2 *
FROM
    orders
ORDER BY
    order_date DESC
    -- HACK CODING ORDER :
    -- SELECT DISTINCT EXECUTED ---5
    --  TOP 2 EXECUTED ---7
    -- COL1,SUM(COL2)
    -- FROM table --- EXECUTED ---1
    -- WHERE COL = 10 EXECUTED ---2
    -- GROUP BY COL 1 EXECUTED ---3
    -- HAVING SUM(COL2)>20 EXECUTED ---4
    -- ORDER BY COL1 ASC EXECUTED ---6