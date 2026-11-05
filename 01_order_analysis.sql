-- Olist E-Commerce SQL Portfolio
-- Analysis: Order volume and order statuses
-- Purpose: Understand order activity and fulfillment outcomes.

-- Query 1: Count orders by status
-- Shows how many orders are delivered, canceled, shipped, etc.
SELECT order_status, COUNT(*) AS total_orders
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY total_orders DESC;

-- Query 2: Count orders by customer state
-- Identifies the states with the highest order volume.
SELECT c.customer_state, COUNT(*) AS total_orders
FROM olist_orders_dataset AS o
INNER JOIN olist_customers_dataset AS c
ON o.customer_id = c.customer_id
GROUP BY c.customer_state
ORDER BY total_orders DESC;

-- Query 3: Identify orders without matching order items
-- Helps investigate missing order-item records.
SELECT o.order_status, COUNT(*) AS orders_without_items
FROM olist_orders_dataset AS o
LEFT JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id
WHERE i.order_id IS NULL
GROUP BY o.order_status
ORDER BY orders_without_items DESC;
