
-- Top 10 Sellers by Revenue
SELECT TOP 10 
       seller_id, 
       ROUND(SUM(payment_value), 0) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY seller_id
ORDER BY total_revenue DESC;


-- Average Orders per Customer
SELECT AVG(order_count) AS avg_orders_per_customer
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) AS t;


--Orders per Month (Trend)
SELECT YEAR(order_purchase_timestamp) AS yr,
       MONTH(order_purchase_timestamp) AS mnth,
       COUNT(order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_purchase_timestamp), MONTH(order_purchase_timestamp)
ORDER BY yr, mnth;


--Top 10 Products by Revenue
SELECT TOP 10 product_id,ROUND( SUM(payment_value), 0) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN payments p ON o.order_id = p.order_id
GROUP BY product_id
ORDER BY total_revenue DESC;


--Customer Count per State
SELECT customer_state, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

