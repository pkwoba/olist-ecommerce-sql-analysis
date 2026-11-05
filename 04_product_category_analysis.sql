-- Olist E-Commerce SQL Portfolio
-- Analysis: Product category sales
-- Period: January 2017 - August 2018
-- Purpose: Rank product categories by purchased item sales value.
-- Missing categories are labeled 'Unknown'.
-- Categories without English translations retain their Portuguese names.
-- Sales value excludes shipping fees.

SELECT COALESCE(t.product_category_name_english, p.product_category_name, 'Unknown') AS category, COUNT(*) AS items_sold, 
ROUND(SUM(i.price), 2) AS total_item_sales_value
FROM olist_orders_dataset AS o
INNER JOIN olist_order_items_dataset AS i
ON o.order_id = i.order_id
INNER JOIN olist_products_dataset AS p
ON i.product_id = p.product_id
LEFT JOIN product_category_name_translation AS t
ON p.product_category_name = t.product_category_name
WHERE o.order_purchase_timestamp >= '2017-01-01'
AND o.order_purchase_timestamp < '2018-09-01'
GROUP BY COALESCE(t.product_category_name_english, p.product_category_name, 'Unknown')
ORDER BY total_item_sales_value DESC;




























