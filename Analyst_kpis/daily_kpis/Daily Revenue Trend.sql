-- Daily revenue generated from completed payments
-- 📌 Business use:
-- Finance checks revenue every morning
--Feeds dashboards


SELECT
    o.order_date,
    SUM(p.payment_value) AS daily_revenue
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
GROUP BY o.order_date
ORDER BY o.order_date;
