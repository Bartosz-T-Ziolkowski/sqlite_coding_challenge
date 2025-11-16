SELECT c.first_name || ' ' || c.last_name AS customer_name, SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;

SELECT p.category, SUM(oi.quantity * oi.unit_price) AS revenue
FROM products AS p
JOIN order_items AS oi ON oi.product_id = p.id
JOIN orders AS o ON o.id = oi.order_id
GROUP BY p.category
ORDER BY revenue DESC;