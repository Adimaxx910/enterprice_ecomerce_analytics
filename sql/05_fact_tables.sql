-- FACT_ORDERS (CORE FACT)

CREATE OR REPLACE TABLE analytics.fact_orders AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    d.year,
    d.month,
    d.week,
    o.order_status
FROM staging.orders o
JOIN analytics.dim_date d
ON o.order_date = d.date;

ALTER TABLE analytics.fact_orders
ADD CONSTRAINT pk_fact_orders PRIMARY KEY (order_id);

ALTER TABLE analytics.fact_orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES analytics.dim_customers(customer_id);

-- FACT_ORDER_ITEMS (REVENUE DETAIL)

CREATE OR REPLACE TABLE analytics.fact_order_items AS
SELECT
    oi.order_id,
    oi.order_item_id,
    oi.product_id,
    oi.price,
    oi.freight_value,
    oi.total_item_value
FROM staging.order_items oi;

ALTER TABLE analytics.fact_order_items
ADD CONSTRAINT fk_items_order
FOREIGN KEY (order_id)
REFERENCES analytics.fact_orders(order_id);

-- FACT_PAYMENTS (FINANCIAL FACT)
CREATE OR REPLACE TABLE analytics.fact_payments AS
SELECT
    p.order_id,
    p.payment_sequential,
    p.payment_type,
    p.payment_installments,
    p.payment_value
FROM staging.payments p;

ALTER TABLE analytics.fact_payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (order_id)
REFERENCES analytics.fact_orders(order_id);

