-- Payment breakdown by type


SELECT
    payment_type,
    COUNT(*) AS total_transactions,
    SUM(payment_value) AS total_amount
FROM analytics.fact_payments
GROUP BY payment_type
ORDER BY total_amount DESC;
