--Business question:

--“Are we acquiring new users or relying on repeat customers?”
--this querry gives how many new customers we are generating and how many repeated customers orders are coming 


WITH first_order AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM analytics.fact_orders
    GROUP BY customer_id
)
SELECT
    o.order_date,
    COUNT(CASE WHEN o.order_date = f.first_order_date THEN 1 END) AS new_customers,
    COUNT(CASE WHEN o.order_date > f.first_order_date THEN 1 END) AS returning_customers
FROM analytics.fact_orders o
JOIN first_order f
    ON o.customer_id = f.customer_id
GROUP BY o.order_date
ORDER BY o.order_date;
