USE MyDatabase
SELECT
    COUNT(*) AS total_nr_orders,
    SUM(sales) AS total_sales,
    AVG(sales) AS avg_sales,
    MAX(sales) highest_sales,
    MIN(sales) lowest_sales
FROM
    orders