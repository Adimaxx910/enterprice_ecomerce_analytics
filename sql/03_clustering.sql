-- BASIC PERFORMANCE OPTIMIZATION

-- Snowflake does NOT use indexes like MySQL or PostgreSQL.
-- Try to store rows with similar order_date values close together
-- if search happens it will search by relative cluster -saves time and gud efficiency 

ALTER TABLE staging.orders
CLUSTER BY (order_date);
