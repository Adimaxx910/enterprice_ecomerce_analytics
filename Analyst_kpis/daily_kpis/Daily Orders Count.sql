-- Number of orders placed per day

SELECT
    order_date,
    COUNT(DISTINCT order_id) AS total_orders
FROM analytics.fact_orders
GROUP BY order_date
ORDER BY order_date;
