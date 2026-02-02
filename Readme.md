# Enterprise E-Commerce Analytics 
Tech Stack: Snowflake · Advanced SQL · Python (pandas, matplotlib) · Analytics Engineering

## 📌 Project Overview
Build an end-to-end analytics workflow on a large e-commerce dataset to demonstrate how real analytics teams:

Model data in a warehouse
Create business KPIs using SQL
Automate snapshots
Deliver manager & executive dashboards using Python.

---

## 🏗️ Architecture Overview

```text
Source Data
(MySQL / CSV)
      |
      v
Snowflake
├── RAW        → Raw ingested data (as-is)
├── STAGING    → Cleaned & standardized data
├── ANALYTICS  → Star schema (facts & dimensions)
      |
      v
KPI Layer (Views + Snapshot Tables)
      |
      v
Python Dashboards &PNG reports



## 🔧 Tech Stack

- **Data Warehouse:** Snowflake  
- **Querying & Modeling:** Advanced SQL  
- **Automation:** Snowflake TASKS  
- **Dashboards:** Python (pandas, matplotlib)




📂 Project Structure
enterprice_ecomerce_analytics/
│
├── sql/
│   ├── raw/
│   ├── staging/
│   ├── analytics/
│   │   ├── fact_orders.sql
│   │   ├── fact_payments.sql
│   │   └── dimensions.sql
│   │
│   ├── kpi/
│   │   ├── daily_business_kpis.sql
│   │   ├── weekly_growth_kpis.sql
│   │   ├── customer_new_vs_returning.sql
│   │   └── executive_daily_snapshot_task.sql
│
├── dashboards_python/
│   ├── notebooks/
│   │   ├── 01_data_exploration.ipynb
│   │   ├── 02_manager_dashboard.ipynb
│   │   └── 03_executive_dashboard.ipynb
│   │
│   ├── src/
│   │   └── snowflake_client.py
│   │
│   └── reports/
│       └── images/
│           ├── manager_dashboard.png
│           └── executive_dashboard.png
│
├── README.md
└── requirements.txt




---

## 📐 What Was Built

### 1. Data Modeling (Snowflake)
- Loaded large e-commerce datasets
- Built fact and dimension tables
- Followed analytics-engineering structure

### 2. KPI Layer (SQL)
Created reusable KPI views for:
- Daily revenue & orders
- Average Order Value (AOV)
- New vs returning customers
- Week-over-Week growth

All business logic handled in **SQL**.

### 3. Executive Snapshot (Automation)
- Daily KPI snapshot table
- Automated using **Snowflake TASK**
- Historical-data safe (`MAX(order_date)`)
- NULL-safe aggregations

### 4. Python Dashboards
- Connected to Snowflake using **SQLAlchemy**
- Built dashboards using **matplotlib only**
- Separate views for:
  - Managers (operational)
  - Executives (strategic)

---

## 📊 Dashboards (Outputs)

### Manager Dashboard
- Daily revenue trend
- Orders per day
- New vs returning customers
- Revenue by payment type

📁 `dashboards_python/reports/images/manager_dashboard.png`

---

### Executive Dashboard
- Revenue trend
- AOV trend
- Orders trend
- Latest business-day KPI snapshot

📁 `dashboards_python/reports/images/executive_dashboard.png`

---

## ⚠️ Key Challenges Addressed

- Historical data vs current dates  
- NULL KPIs breaking dashboards  
- Snowflake + pandas integration  
- Empty matplotlib exports  
- Dashboard readability & layout  

Each issue was resolved using **production-style solutions**.

---

## 🎯 Outcome

- Fully automated KPI pipeline in Snowflake  
- Python-based dashboards without BI tools  
- Versioned dashboard images for reporting  
- Recruiter-ready analytics project  

---

## 🧠 One-Line Summary

Built an enterprise-style analytics pipeline with Snowflake and Python, delivering automated KPIs and manager/executive dashboards.





