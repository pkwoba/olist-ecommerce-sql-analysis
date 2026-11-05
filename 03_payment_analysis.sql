-- Olist E-Commerce SQL Portfolio
-- Analysis: Payment trends and average payment per order
-- Period: January 2017 - August 2018
-- Purpose: Examine monthly payment values and spending patterns.
-- Payment values are not necessarily recognized revenue.
-- Orders may have multiple payment records.

-- Query 1: Total payment value by purchase month
-- Includes all payment records associated with each order.
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS purchase_month,ROUND(SUM(p.payment_value), 2) AS total_payment_value
FROM olist_orders_dataset AS o
INNER JOIN olist_order_payments_dataset AS p
ON o.order_id = p.order_id
WHERE o.order_purchase_timestamp >= '2017-01-01'
AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY purchase_month
ORDER BY purchase_month;

-- Query 2: Average payment value per unique order
-- Divides total payment value by the number of distinct orders.
SELECT strftime('%Y-%m', o.order_purchase_timestamp) AS purchase_month,COUNT(DISTINCT o.order_id) AS total_orders,
ROUND(SUM(p.payment_value), 2) AS total_payment_value,ROUND( SUM(p.payment_value) * 1.0 / COUNT(DISTINCT o.order_id),2) AS 
average_payment_per_order
FROM olist_orders_dataset AS o
INNER JOIN olist_order_payments_dataset AS p
ON o.order_id = p.order_id
WHERE o.order_purchase_timestamp >= '2017-01-01'
AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY purchase_month
ORDER BY purchase_month;
