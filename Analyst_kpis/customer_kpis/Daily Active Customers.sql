-- Customers who placed at least one order per day
SELECT
    order_date,
    COUNT(DISTINCT customer_id) AS active_customers
FROM analytics.fact_orders
GROUP BY order_date
ORDER BY order_date;
