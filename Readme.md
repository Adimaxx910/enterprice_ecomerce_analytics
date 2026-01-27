# Enterprise E-Commerce Analytics Platform  
(SQL • Snowflake • MySQL • Python)

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
