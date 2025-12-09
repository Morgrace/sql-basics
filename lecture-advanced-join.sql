USE MyDatabase
-- LEFT ANTI JOIN
SELECT
    *
FROM
    customers C
    LEFT JOIN orders O ON C.id = O.customer_id
WHERE
    O.customer_id IS NULL
    -- RIGHT ANTI JOIN
SELECT
    *
FROM
    customers c
    RIGHT JOIN orders o ON c.id = o.customer_id
WHERE
    c.id IS NULL
    -- SAME RESULT FROM THE RIGHT ANII JOIN USING LEFT ANTI JOIN
SELECT
    *
FROM
    orders o
    LEFT JOIN customers c ON c.id = o.customer_id
WHERE
    c.id IS NULL
    --FULL ANTI JOIN
SELECT
    *
FROM
    customers C
    FULL JOIN orders O ON C.id = O.customer_id
WHERE
    C.id IS NULL
    OR O.customer_id IS NULL
    -- TODO EXERCISE ---1 
    -- Get all customers along with their oders, but only for customers how have placed an order (without using inner join)
SELECT
    *
FROM
    customers C
    LEFT JOIN orders O ON C.id = O.customer_id
WHERE
    O.customer_id IS NOT NULL
    -- CROSS JOINS
SELECT
    *
FROM
    customers
    CROSS JOIN orders