-- Average order value per day

SELECT
    o.order_date,
    ROUND(
        SUM(p.payment_value) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
GROUP BY o.order_date
ORDER BY o.order_date;
