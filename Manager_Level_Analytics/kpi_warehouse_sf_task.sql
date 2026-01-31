
-- CREATE A DEDICATED TASK WAREHOUSE
CREATE WAREHOUSE IF NOT EXISTS kpi_wh
WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE;

-- PREPARE SNAPSHOT TABLE (ONE-TIME)
-- I have slightly improved my snapshot table to allow multiple days.

CREATE OR REPLACE TABLE kpi.executive_daily_snapshot (
    report_date DATE,
    total_orders NUMBER,
    total_revenue NUMBER(18,2),
    active_customers NUMBER,
    avg_order_value NUMBER(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- SNAPSHOT INSERT LOGIC (CORE SQL)
-- This is the SQL your TASK will run daily.

INSERT INTO kpi.executive_daily_snapshot
SELECT
    CURRENT_DATE() - 1                     AS report_date,
    COUNT(DISTINCT o.order_id)             AS total_orders,
    SUM(p.payment_value)                   AS total_revenue,
    COUNT(DISTINCT o.customer_id)          AS active_customers,
    ROUND(
        SUM(p.payment_value) / COUNT(DISTINCT o.order_id),
        2
    )                                      AS avg_order_value,
    CURRENT_TIMESTAMP                      AS created_at
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
WHERE o.order_date = CURRENT_DATE() - 1;

-- //CREATE THE SNOWFLAKE TASK (THE MAGIC )
CREATE OR REPLACE TASK kpi.daily_executive_snapshot_task
WAREHOUSE = kpi_wh
SCHEDULE = 'USING CRON 0 6 * * * UTC'
AS
INSERT INTO kpi.executive_daily_snapshot
SELECT
    CURRENT_DATE() - 1                     AS report_date,
    COUNT(DISTINCT o.order_id)             AS total_orders,
    SUM(p.payment_value)                   AS total_revenue,
    COUNT(DISTINCT o.customer_id)          AS active_customers,
    ROUND(
        SUM(p.payment_value) / COUNT(DISTINCT o.order_id),
        2
    )                                      AS avg_order_value,
    CURRENT_TIMESTAMP                      AS created_at
FROM analytics.fact_orders o
JOIN analytics.fact_payments p
    ON o.order_id = p.order_id
WHERE o.order_date = CURRENT_DATE() - 1;


-- ENABLE THE TASK (VERY IMPORTANT)
ALTER TASK kpi.daily_executive_snapshot_task RESUME;

-- MONITOR & VALIDATE (ENTERPRISE HABIT)
SHOW TASKS LIKE 'DAILY_EXECUTIVE%';

SELECT *
FROM TABLE(
    INFORMATION_SCHEMA.TASK_HISTORY(
        TASK_NAME => 'DAILY_EXECUTIVE_SNAPSHOT_TASK'
    )
)
ORDER BY COMPLETED_TIME DESC;

SELECT *
FROM kpi.executive_daily_snapshot
ORDER BY report_date DESC;
