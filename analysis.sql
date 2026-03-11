-- RETAIL SALES ANALYSIS — Analytics Queries
-- Author: Srivatchan

-- QUERY 1: Total Revenue Overview
SELECT
    SUM(quantity * unit_price) AS total_revenue,
    COUNT(DISTINCT order_id)   AS total_orders,
    COUNT(DISTINCT product_id) AS unique_products_sold,
    ROUND(SUM(quantity * unit_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM order_items;


-- QUERY 2: Revenue by Product Category
SELECT
    p.category,
    COUNT(DISTINCT oi.order_id)            AS total_orders,
    SUM(oi.quantity)                        AS units_sold,
    SUM(oi.quantity * oi.unit_price)        AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.unit_price) * 100.0 /
        SUM(SUM(oi.quantity * oi.unit_price)) OVER (), 2
    ) AS revenue_share_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;


-- QUERY 3: Monthly Revenue Trend (2024)
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m')          AS month,
    COUNT(DISTINCT o.order_id)                  AS orders,
    SUM(oi.quantity * oi.unit_price)            AS monthly_revenue,
    LAG(SUM(oi.quantity * oi.unit_price))
        OVER (ORDER BY DATE_FORMAT(o.order_date, '%Y-%m')) AS prev_month_revenue,
    ROUND(
        (SUM(oi.quantity * oi.unit_price) -
         LAG(SUM(oi.quantity * oi.unit_price))
            OVER (ORDER BY DATE_FORMAT(o.order_date, '%Y-%m'))) * 100.0 /
        NULLIF(LAG(SUM(oi.quantity * oi.unit_price))
            OVER (ORDER BY DATE_FORMAT(o.order_date, '%Y-%m')), 0), 2
    ) AS mom_growth_pct
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;


-- QUERY 4: Top 10 Customers by Lifetime Value
SELECT
    c.customer_name,
    c.city,
    c.region,
    COUNT(DISTINCT o.order_id)            AS total_orders,
    SUM(oi.quantity * oi.unit_price)      AS lifetime_value,
    RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS value_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city, c.region
ORDER BY lifetime_value DESC
LIMIT 10;


-- QUERY 5: Best Performing Products (by Revenue)
SELECT
    p.product_name,
    p.category,
    SUM(oi.quantity)                   AS units_sold,
    SUM(oi.quantity * oi.unit_price)   AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS revenue_rank,
    RANK() OVER (
        ORDER BY SUM(oi.quantity) DESC
    ) AS volume_rank
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC;


-- QUERY 6: Revenue by Region
SELECT
    c.region,
    COUNT(DISTINCT c.customer_id)          AS customers,
    COUNT(DISTINCT o.order_id)             AS orders,
    SUM(oi.quantity * oi.unit_price)       AS total_revenue,
    ROUND(AVG(oi.quantity * oi.unit_price), 2) AS avg_item_value
FROM customers c
JOIN orders o  ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.region
ORDER BY total_revenue DESC;


-- QUERY 7: Customer Segmentation (RFM-style)
WITH customer_stats AS (
    SELECT
        c.customer_id,
        c.customer_name,
        COUNT(DISTINCT o.order_id)           AS frequency,
        SUM(oi.quantity * oi.unit_price)     AS monetary,
        MAX(o.order_date)                    AS last_order_date
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    frequency,
    monetary,
    last_order_date,
    CASE
        WHEN monetary >= 100000 THEN 'High Value'
        WHEN monetary >= 50000  THEN 'Mid Value'
        ELSE                         'Low Value'
    END AS customer_segment
FROM customer_stats
ORDER BY monetary DESC;


-- QUERY 8: Running Total Revenue (Cumulative)
WITH monthly AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m')  AS month,
        SUM(oi.quantity * oi.unit_price)    AS monthly_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM monthly
ORDER BY month;


-- QUERY 9: Category Performance per Region (Pivot-style)
SELECT
    c.region,
    SUM(CASE WHEN p.category = 'Electronics' THEN oi.quantity * oi.unit_price ELSE 0 END) AS electronics_revenue,
    SUM(CASE WHEN p.category = 'Furniture'   THEN oi.quantity * oi.unit_price ELSE 0 END) AS furniture_revenue,
    SUM(CASE WHEN p.category = 'Books'       THEN oi.quantity * oi.unit_price ELSE 0 END) AS books_revenue,
    SUM(CASE WHEN p.category = 'Accessories' THEN oi.quantity * oi.unit_price ELSE 0 END) AS accessories_revenue,
    SUM(oi.quantity * oi.unit_price)                                                        AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.region
ORDER BY total_revenue DESC;


-- QUERY 10: Products Never Ordered (Data Quality Check)
SELECT
    p.product_id,
    p.product_name,
    p.category,
    p.unit_price
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;
