-- Executive daily snapshot (yesterday)

SELECT
    CURRENT_DATE() - 1 AS report_date,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.payment_value) AS total_revenue,
    COUNT(DISTINCT o.customer_id) AS total_customers
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
WHERE o.order_date = CURRENT_DATE() - 1;
