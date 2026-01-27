-- OLIST_ANALYTICS-- 
CREATE DATABASE olist_analytics;
USE DATABASE olist_analytics;
CREATE SCHEMA raw;
CREATE SCHEMA analytics;OLIST_ANALYTICS.RAW
CREATE SCHEMA IF NOT EXISTS staging;

-- warehouse act as a centralised repository for the company data

CREATE WAREHOUSE olist_wh
WITH WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;

USE WAREHOUSE olist_wh;