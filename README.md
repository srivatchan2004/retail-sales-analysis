# 🛒 Retail Sales Analysis — SQL Portfolio Project

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue?style=flat-square&logo=postgresql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)
![Domain](https://img.shields.io/badge/Domain-Data%20Analytics-orange?style=flat-square)

An end-to-end SQL analytics project built on a simulated Indian retail dataset covering **36 orders**, **15 customers**, **15 products**, and **4 categories** across 2024.

---

## 📁 Project Structure

```
retail-sales-analysis/
├── schema.sql      → Table creation + sample data (72 order line items)
├── analysis.sql    → 10 analytics queries
└── insights.md     → Business findings & recommendations
```

---

## 🗂️ Database Schema

```
customers ──< orders ──< order_items >── products
```

| Table         | Rows | Description                        |
|---|---|---|
| `customers`   | 15   | Customer info with city and region |
| `products`    | 15   | Products with category & price     |
| `orders`      | 36   | Orders placed in 2024              |
| `order_items` | 72   | Line items linking orders/products |

---

## 📊 Analyses Performed

| # | Analysis | SQL Concepts Used |
|---|---|---|
| 1 | Total Revenue Overview | Aggregates, `ROUND` |
| 2 | Revenue by Category | `GROUP BY`, Window `SUM() OVER()` |
| 3 | Monthly Revenue Trend | `LAG()`, MoM Growth % |
| 4 | Top 10 Customers by LTV | Multi-table `JOIN`, `RANK()` |
| 5 | Best Performing Products | `RANK()` by revenue & volume |
| 6 | Revenue by Region | Multi-table `JOIN`, `AVG` |
| 7 | Customer Segmentation | CTE, `CASE WHEN` |
| 8 | Cumulative Revenue | Running total with `ROWS UNBOUNDED` |
| 9 | Category × Region Pivot | `CASE WHEN` pivot-style aggregation |
| 10 | Data Quality Check | `LEFT JOIN` for NULL detection |

---

## 💡 Key Insights

- **Electronics** dominates with ~65% revenue share — Laptop Pro 15 is the top product
- **South region** (Chennai, Bangalore, Hyderabad) contributes ~45% of total revenue
- Sales peaked in **Q4 2024** — indicating seasonal buying patterns
- Top 3 customers by lifetime value are repeat buyers placing 3+ orders annually
- **East and Central regions** are underrepresented — clear growth opportunity

---

## 🚀 How to Run

**Option 1 — PostgreSQL (recommended)**
```bash
# Create database
createdb retail_sales

# Load schema and data
psql -d retail_sales -f schema.sql

# Run analysis
psql -d retail_sales -f analysis.sql
```

**Option 2 — Online (no install needed)**
1. Go to [db-fiddle.com](https://www.db-fiddle.com) or [sqlfiddle.com](http://sqlfiddle.com)
2. Paste `schema.sql` in the Schema panel
3. Paste any query from `analysis.sql` in the Query panel
4. Click **Run**

---

## 🛠️ SQL Concepts Covered

```
✅ SELECT, WHERE, ORDER BY, LIMIT
✅ GROUP BY with SUM, COUNT, AVG
✅ INNER JOIN, LEFT JOIN across 3+ tables
✅ Window Functions — RANK(), LAG(), SUM() OVER()
✅ CTEs (WITH clause)
✅ CASE WHEN for segmentation and pivot
✅ NULLIF, COALESCE for safe division
✅ Date functions with TO_CHAR
✅ Subqueries and derived tables
✅ Data quality checks with NULL detection
```

---

## 👤 Author

**Srivatchan**
- 📧 Final Year B.E. — Electronics & Communication Engineering
- 🔗 [LinkedIn](https://linkedin.com/in/srivatchan2004)
- 💻 [GitHub](https://github.com/srivatchan2004)

---

## 📌 Tags
`SQL` `PostgreSQL` `Data Analytics` `Retail Analytics` `Portfolio Project` `Window Functions` `CTE`
