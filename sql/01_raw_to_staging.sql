-- *creating staged tables from raw tables for proper analytics*---

--- staging the customer table for city and state format change 
CREATE OR REPLACE TABLE staging.customers AS
SELECT
    customer_id,
    customer_unique_id,
    INITCAP(customer_city)        AS customer_city,
    UPPER(customer_state)         AS customer_state,
    customer_zip_code_prefix
FROM raw.olist_customers
WHERE customer_id IS NOT NULL;

-- staging the product category

CREATE OR REPLACE TABLE staging.products AS
SELECT
    product_id,
    LOWER(product_category_name)  AS product_category,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM raw.olist_products
WHERE product_id IS NOT NULL;


// staging all the dates to the same format if any changes are there 

CREATE OR REPLACE TABLE staging.orders AS
SELECT
    order_id,
    customer_id,
    LOWER(order_status)                               AS order_status,
    TO_DATE(order_purchase_timestamp)                 AS order_date,
    TO_DATE(order_approved_at)                        AS approved_date,
    TO_DATE(order_delivered_customer_date)            AS delivered_date,
    TO_DATE(order_estimated_delivery_date)            AS estimated_delivery_date
FROM raw.olist_orders_dataset
WHERE order_purchase_timestamp IS NOT NULL;


-- staging order items table with price+freight_value as total value of the product

CREATE OR REPLACE TABLE staging.order_items AS
SELECT
    order_id,
    order_item_id,
    product_id,
    price,
    freight_value,
    price + freight_value AS total_item_value
FROM raw.olist_order_items
WHERE price IS NOT NULL;


--staging the payments table -lowercase of payment type

CREATE OR REPLACE TABLE staging.payments AS
SELECT
    order_id,
    payment_sequential,
    LOWER(payment_type)         AS payment_type,
    payment_installments,
    payment_value
FROM raw.olist_order_payments
WHERE payment_value IS NOT NULL;


