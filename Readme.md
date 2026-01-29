# Enterprise E-Commerce Analytics Platform  
(SQL • Snowflake  • Python)

## 📌 Project Overview
This project simulates a **real-world enterprise analytics platform** built for an e-commerce company.  
It demonstrates **end-to-end data engineering, analytics modeling, and advanced SQL analysis** using both
traditional databases (MySQL) and a modern cloud data warehouse (Snowflake).

The project is designed to showcase how **data analysts and analytics engineers** work with large datasets
to deliver **daily KPIs, management insights, and advanced business analytics**.

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
SQL Analytics & Python Automation
      |
      v
Business KPIs & Insights



🛠️ Tech Stack

SQL – Advanced querying, analytics, window functions
Snowflake – Cloud data warehouse & ELT processing
MySQL – Source OLTP database
Python – Data generation, validation & automation
Git & GitHub – Version control & project collaboration





📂 Project Structure
enterprice_ecomerce_analytics/
│
├── Readme.md
│
├── olistdata/
│   └── csv_files_used_for_ingestion/
│
├── sql/
│   ├── 01_raw_to_staging.sql
│   ├── 02_data_quality_checks.sql
│   ├── 03_clustering.sql
│   ├── 04_dim_tables.sql
│   ├── 05_fact_tables.sql
│   ├── 06_constraints.sql
│   └── 07_clustering.sql
│
├── Analyst_kpis/
│   ├── 08_daily_kpis.sql
│   ├── 09_customer_kpis.sql
│   └── 10_operational_kpis.sql
│
└── Manager_Level_Analytics/
    ├── 11_growth_metrics.sql
    ├── 12_rankings.sql
    ├── 13_revenue_analysis.sql
    └── 14_executive_summary.sql






🧱 Data Engineering Workflow
1️⃣ RAW Layer

Direct ingestion from MySQL / CSV
No transformations
Acts as a single source of truth

2️⃣ STAGING Layer

Data cleaning & normalization
Timestamp → date conversions
Derived metrics (e.g., total item value)
Data quality checks

3️⃣ ANALYTICS Layer (Star Schema)

Fact tables: Orders, Payments, Order Items
Dimension tables: Customers, Products, Date
Optimized for BI tools & analytics queries

📊 Business Use Cases Covered
✔ Analyst Daily Work
Daily revenue tracking
Order volume & health
Failed / non-completed orders
New vs returning customers
Average order value (AOV)

✔ Manager / Leadership Insights
Top-performing products
Revenue trends & growth
Weekly / monthly performance
Customer behavior analysis

✔ Advanced Analytics (SQL)

Window functions (LAG, RANK, ROW_NUMBER)
Funnel analysis
Cohort retention analysis
Rolling averages
Percentile analysis (PERCENTILE_CONT)
Query optimization & clustering

🚀 Why This Project Is Different

Built using enterprise data modeling practices
Uses Snowflake ELT architecture
Combines SQL + Python realistically
Focuses on business questions, not just queries
Structured & documented like a real company project

📈 Example KPI Questions Answered

How much revenue did we generate yesterday?
Are customers new or returning?
Which products drive the most revenue?
How is revenue trending week-over-week?
Where are we losing customers in the funnel?

🧠 Key Learnings Demonstrated

End-to-end data pipeline design
Star schema modeling
Advanced SQL analytics
Performance optimization in Snowflake
Translating data into business insights

📬 Author

Adithya G
Data Analyst | Analytics Engineer
Focused on building scalable, data-driven business solutions
