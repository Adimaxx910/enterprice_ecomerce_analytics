-- Detect unpaid orders


SELECT
    o.order_id,
    o.order_date
FROM analytics.fact_orders o
LEFT JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
WHERE p.order_id IS NULL;
