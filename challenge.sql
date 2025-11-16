-- Used SQLite and VSCode

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

SELECT e.first_name, e.last_name, d.name AS department_name, e.salary, (SELECT AVG(e2.salary) FROM employees AS e2 WHERE e2.department_id = e.department_id) AS avg_department_salary
FROM employees AS e
JOIN departments AS d ON d.id = e.department_id
WHERE e.salary > (SELECT AVG(e3.salary) FROM employees AS e3 WHERE e3.department_id = e.department_id)
ORDER BY d.name, e.salary DESC;

SELECT city, COUNT(*) AS gold_customers
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customers DESC, city;