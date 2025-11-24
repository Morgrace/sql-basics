USE MyDatabase
-- LESSON: INNER JOIN
SELECT
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM
    customers C
    INNER JOIN orders O ON C.id = O.customer_id
    -- LESSON: LEFT JOIN:
SELECT
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM
    customers C
    LEFT JOIN orders O ON C.id = O.customer_id
    -- LESSON: RIGHT JOIN
SELECT
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM
    customers C
    RIGHT JOIN orders O ON C.id = O.customer_id
    -- EXERCISE
SELECT
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM
    orders O
    LEFT JOIN customers C ON C.id = O.customer_id
    -- FULL JOIN
SELECT
    C.id,
    C.first_name,
    O.order_id,
    O.sales
FROM
    orders O
    FULL JOIN customers C ON C.id = O.customer_id