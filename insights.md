# Business Insights — Retail Sales Analysis

## Key Findings from 2024 Data

### 1. Revenue Overview
- **Total Revenue**: ₹19.8L+ across 36 orders in 2024
- **Average Order Value**: ₹55,000+ per order
- **Unique Products Sold**: 15 products across 4 categories

---

### 2. Category Performance
| Category     | Revenue Share | Insight |
|---|---|---|
| Electronics  | ~65%          | Dominant category — laptops & monitors drive most revenue |
| Furniture    | ~22%          | High per-unit value; standing desks & chairs sell well |
| Books        | ~8%           | Low revenue but high volume — strong attach rate to other items |
| Accessories  | ~5%           | Frequently bundled with electronics orders |

**Recommendation**: Stock Electronics heavily; consider bundle promotions pairing Accessories with Electronics to increase Accessories share.

---

### 3. Monthly Sales Trend
- Sales peaked in **Q4 (Oct–Dec)** — holiday/year-end buying behavior
- **January and April** showed strong starts to each quarter
- MoM growth was volatile in mid-year (May–July) — likely opportunity for mid-year promotions

---

### 4. Top Customers
- Top 3 customers by lifetime value are all from the **South region** (Chennai, Bangalore, Hyderabad)
- High-value customers tend to place **3+ orders per year** with large cart sizes
- Customer **Arjun Sharma (Chennai)** placed the most repeat orders (3 orders)

**Recommendation**: Implement a loyalty program targeting customers with 2+ orders to convert them into high-value repeat buyers.

---

### 5. Regional Performance
- **South region** contributes the highest revenue (~45%) — largest customer base
- **West region** follows with Maharashtra and Gujarat customers
- **East and Central regions** are underrepresented — growth opportunity

**Recommendation**: Run targeted campaigns in North, East, and Central regions to expand customer base.

---

### 6. Customer Segmentation
| Segment    | Criteria         | Action |
|---|---|---|
| High Value | LTV ≥ ₹1,00,000  | Retain with exclusive offers |
| Mid Value  | LTV ₹50K–₹1L     | Upsell to increase order size |
| Low Value  | LTV < ₹50,000    | Re-engagement campaigns |

---

### 7. Product Insights
- **Laptop Pro 15** is the highest revenue product — appears in nearly every high-value order
- **Monitor 27 inch** has strong volume and revenue
- **Books category** drives volume but needs higher-margin titles added

---

## SQL Concepts Demonstrated
- `GROUP BY` with aggregate functions (`SUM`, `COUNT`, `AVG`)
- `JOIN` across 3+ tables
- Window functions: `RANK()`, `LAG()`, `SUM() OVER()`
- CTEs (`WITH` clause) for clean query structure
- `CASE WHEN` for customer segmentation and pivot-style queries
- `LEFT JOIN` for data quality checks (finding unordered products)
- Date functions for time-series analysis
