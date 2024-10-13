-- Objective: Analyse Customer Behavior
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- Combine the menu_items and order_details tables into a single table.
SELECT *
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;

-- What were the least and most ordered items ?

SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- What were the top 5 orders that spent the most money ?

SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

-- View the details of the highest spend order

SELECT category, COUNT(item_id) AS num_items, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category
ORDER BY num_items DESC;


-- View the  details of the top 5 the highest spend order

SELECT category, COUNT(item_id) AS num_items, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY category
ORDER BY order_id;

SELECT order_id, category, COUNT(item_id) AS num_items, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440,2075,1957,330,2675)
GROUP BY order_id, category
ORDER BY num_items DESC;
