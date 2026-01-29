--8. Executive Monthly Snapshot
--total monthly orders,customers,monthly evenue, average order value 


SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(p.payment_value) AS total_revenue,
    COUNT(DISTINCT o.customer_id) AS active_customers,
    ROUND(
        SUM(p.payment_value) / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

----Create a Manager View -plus point 

CREATE OR REPLACE VIEW analytics.monthly_business_summary AS
SELECT
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(p.payment_value) AS revenue,
    COUNT(DISTINCT o.order_id) AS orders,
    COUNT(DISTINCT o.customer_id) AS customers
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
GROUP BY month;
