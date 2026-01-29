--1. Weekly Revenue & WoW Growth %
--      “Are we growing week over week?”

USE DATABASE olist_analytics;
USE SCHEMA analytics;

WITH weekly_revenue AS (
    SELECT
        DATE_TRUNC('week', o.order_date) AS week_start,
        SUM(p.payment_value) AS weekly_revenue
    FROM analytics.fact_orders o
    JOIN analytics.fact_payments p
        ON o.order_id = p.order_id
    GROUP BY week_start
)
SELECT
    week_start,
    weekly_revenue,
    LAG(weekly_revenue) OVER (ORDER BY week_start) AS prev_week_revenue,
    ROUND(
        (weekly_revenue - LAG(weekly_revenue) OVER (ORDER BY week_start)) * 100.0
        / LAG(weekly_revenue) OVER (ORDER BY week_start),
        2
    ) AS wow_growth_pct
FROM weekly_revenue
ORDER BY week_start;

--2. Month-over-Month (MoM) Revenue Growth

WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(p.payment_value) AS revenue
    FROM analytics.fact_orders o
    JOIN analytics.fact_payments p
        ON o.order_id = p.order_id
    GROUP BY month
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS prev_month,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) * 100.0
        / LAG(revenue) OVER (ORDER BY month),
        2
    ) AS mom_growth_pct
FROM monthly_revenue
ORDER BY month;
