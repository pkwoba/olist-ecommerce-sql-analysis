-- Olist E-Commerce SQL Portfolio
-- Analysis: Monthly order trends
-- Period: January 2017 - August 2018
-- Purpose: Examine monthly order volume and month-over-month growth.
-- Partial boundary months are excluded to avoid misleading comparisons.

-- Query 1: Count orders by purchase month
-- Excludes incomplete boundary months.
SELECT strftime('%Y-%m', order_purchase_timestamp) AS purchase_month, COUNT(*) AS total_orders
FROM olist_orders_dataset
WHERE order_purchase_timestamp >= '2017-01-01'
AND order_purchase_timestamp < '2018-09-01'
GROUP BY purchase_month
ORDER BY purchase_month;

-- Query 2: Calculate month-over-month order growth
-- LAG() retrieves the previous month's order count.
WITH monthly_orders AS (
SELECT strftime('%Y-%m', order_purchase_timestamp) AS purchase_month, COUNT(*) AS total_orders
FROM olist_orders_dataset
WHERE order_purchase_timestamp >= '2017-01-01'
AND order_purchase_timestamp < '2018-09-01'
GROUP BY purchase_month),
monthly_comparison AS (
SELECT purchase_month,total_orders, LAG(total_orders) OVER (ORDER BY purchase_month) AS previous_month_orders
FROM monthly_orders)
SELECT purchase_month,total_orders,previous_month_orders,ROUND((total_orders - previous_month_orders) * 100.0/ previous_month_orders,2) 
AS monthly_growth_percentage
FROM monthly_comparison
ORDER BY purchase_month;
