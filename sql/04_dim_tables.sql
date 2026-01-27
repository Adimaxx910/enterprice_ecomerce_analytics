USE SCHEMA analytics;

-- DIM_CUSTOMERS - Customers are referenced everywhere.
CREATE OR REPLACE TABLE analytics.dim_customers AS
SELECT
    customer_id,
    customer_unique_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
FROM staging.customers;

ALTER TABLE analytics.dim_customers
ADD CONSTRAINT pk_dim_customers PRIMARY KEY (customer_id);

-- DIM_PRODUCTS
CREATE OR REPLACE TABLE analytics.dim_products AS
SELECT
    product_id,
    product_category,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM staging.products;

ALTER TABLE analytics.dim_products
ADD CONSTRAINT pk_dim_products PRIMARY KEY (product_id);


-- DIM_DATE (VERY IMPORTANT)

CREATE OR REPLACE TABLE analytics.dim_date AS
SELECT
    DATEADD(day, seq4(), '2017-01-01') AS date,
    YEAR(date) AS year,
    MONTH(date) AS month,
    DAY(date) AS day,
    WEEK(date) AS week,
    DAYOFWEEK(date) AS day_of_week,
    TO_CHAR(date, 'YYYY-MM') AS year_month
FROM TABLE(GENERATOR(ROWCOUNT => 4000));

ALTER TABLE analytics.dim_date
ADD CONSTRAINT pk_dim_date PRIMARY KEY (date);