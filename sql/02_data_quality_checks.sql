
-- DATA QUALITY CHECKS 
-- 1)Orders without customers (FK check)

SELECT COUNT(*) AS orphan_orders
FROM staging.orders o
LEFT JOIN staging.customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 2) Payments without orders

SELECT COUNT(*) AS orphan_payments
FROM staging.payments p
LEFT JOIN staging.orders o
ON p.order_id = o.order_id
WHERE o.order_id IS NULL

