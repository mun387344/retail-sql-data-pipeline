# Retail SQL Data Pipeline & Analytics Engineering

End-to-end PostgreSQL data engineering pipeline that ingests raw retail data, enforces relational integrity via primary and foreign key constraints, and transforms transactional records into analytical views, customer value segmentations, regional rankings, and reusable database objects.

---

## Architecture & Pipeline Flow

```text
Raw CSV Files (Customers, Products, Orders)
        │
        ▼
PostgreSQL Staging & Core Tables (3NF Relational Schema)
  ├── customers (PK: customer_id)
  ├── products  (PK: product_id)
  └── orders    (PK: order_id | FK: customer_id, product_id)
        │
        ▼
SQL Transformations & Analytical Queries
  ├── Filtering & Aggregations (Date ranges, channels, regions)
  ├── Customer Value Segmentation (JOINs, GROUP BY, HAVING, CASE)
  ├── Category Performance Analysis (CTEs & Subqueries)
  └── Regional Sales Ranking (Window Functions: RANK / DENSE_RANK)
        │
        ▼
Database Engineering Objects
  ├── Reusable Reporting View (vw_completed_sales)
  ├── Performance Indexing (idx_orders_customer_id)
  ├── Transactional CRUD Safety (UPDATE + ROLLBACK)
  └── Stored Function (fn_customer_order_summary)
```
## Repository Structure

```text
retail-sql-data-pipeline/
├── data/                        # Raw CSV datasets (excluded via .gitignore)
├── sql/                         # Modular SQL scripts in execution order
│   ├── 01_schema_setup.sql      # DDL (CREATE TABLE, PK/FK constraints) & row-count validation
│   ├── 02_filtering_joins.sql   # Online sales filtering & customer segmentation (CASE, HAVING)
│   ├── 03_ctes_windows.sql      # Category AOV via CTEs & regional sales ranking (Window Functions)
│   └── 04_db_objects.sql        # Views, B-Tree indexing, ACID transactions, and stored functions
├── docs/                        # Schema diagrams and query execution screenshots
├── .gitignore                   # Ignores raw CSV files and local environment artifacts
└── README.md                    # Project documentation
```

- **Tools:** PostgreSQL, pgAdmin, Git, GitHub
