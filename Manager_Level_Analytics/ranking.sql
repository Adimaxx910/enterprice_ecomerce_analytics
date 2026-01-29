--1. Top Products by Revenue (RANK)

SELECT
    i.product_id,
    SUM(i.total_item_value) AS total_revenue,
    RANK() OVER (ORDER BY SUM(i.total_item_value) DESC) AS revenue_rank
FROM analytics.fact_order_items i
GROUP BY i.product_id
ORDER BY revenue_rank;


--2.Top Categories by Revenue

SELECT
    p.product_category,
    SUM(i.total_item_value) AS category_revenue,
    DENSE_RANK() OVER (ORDER BY SUM(i.total_item_value) DESC) AS category_rank
FROM analytics.fact_order_items i
JOIN analytics.dim_products p
    ON i.product_id = p.product_id
GROUP BY p.product_category;


--3.Top Customers by Lifetime Value (LTV)
--Understands customer lifetime value.


SELECT
    o.customer_id,
    SUM(p.payment_value) AS lifetime_value,
    RANK() OVER (ORDER BY SUM(p.payment_value) DESC) AS ltv_rank
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
GROUP BY o.customer_id;

