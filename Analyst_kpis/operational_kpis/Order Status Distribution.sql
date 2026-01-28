-- Operational health check
---tracking the total count of orders as per their status 

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM analytics.fact_orders
GROUP BY order_status
ORDER BY total_orders DESC;
