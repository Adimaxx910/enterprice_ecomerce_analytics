--1. Revenue Contribution % (Pareto Analysis)
--“Who is actually driving revenue?”

WITH customer_revenue AS (
    SELECT
        o.customer_id,
        SUM(p.payment_value) AS revenue
    FROM analytics.fact_orders o
    JOIN analytics.fact_payments p
        ON o.order_id = p.order_id
    GROUP BY o.customer_id
),
total_revenue AS (
    SELECT SUM(revenue) AS total FROM customer_revenue
)
SELECT
    c.customer_id,
    c.revenue,
    ROUND(c.revenue * 100.0 / t.total, 2) AS revenue_contribution_pct
FROM customer_revenue c
CROSS JOIN total_revenue t
ORDER BY revenue DESC;

--7. High-Value Orders (PERCENTILE)

SELECT
    PERCENTILE_CONT(0.9)
    WITHIN GROUP (ORDER BY payment_value) AS p90_order_value
FROM analytics.fact_payments;
