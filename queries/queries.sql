# 1 - Simple SELECT FROM WHERE statement
SELECT * FROM `address_cityzip` WHERE `city`='Boulder';

# 2 - SELECT FROM WHERE ORDER BY
SELECT * FROM `employees` WHERE `employee_id` < 5 ORDER BY `employee_name`;

# 3 - SELECT FROM WHERE ORDER BY LIMIT
SELECT * FROM `employees` WHERE `employee_id` < 5 ORDER BY `employee_name` LIMIT 2;

# 4 - SELECT FROM WHERE with implicit JOIN
SELECT 
	address_cityzip.city, 
	address_cityzip.zip, 
	address_zipstate.state 
FROM 
	`address_cityzip`, `address_zipstate` 
WHERE 
	address_cityzip.zip = address_zipstate.zip;

# 5 - SELECT FROM WHERE GROUP BY
# Groups the number of orders by customer_id
SELECT 
	COUNT(orders.order_id) AS NumberOFOrders,
	customers.customer_id,
	customers.customer_name
FROM 
	`orders`, `customers`
WHERE 
	orders.customer_id = customers.customer_id
GROUP BY 
	customers.customer_id

# 6 - SELECT FROM WHERE GROUP BY HAVING
# gives customers that have ordered more than 2 times
SELECT 
	COUNT(orders.order_id) AS NumberOFOrders,
	customers.customer_id,
	customers.customer_name
FROM 
	`orders`, `customers`
WHERE 
	orders.customer_id = customers.customer_id
GROUP BY 
	customers.customer_id
HAVING COUNT(orders.order_id) > 2


# 7 - SELECT FROM WHERE with two implied JOINS, a MAX function, AVG function
# gives 
SELECT MAX(AVG), CustName
FROM (SELECT AVG(orders.total_order_price) AS AVG, customers.customer_name AS CustName
	FROM `orders`, `customers`, `address_cityzip`
	WHERE (orders.customer_id = customers.customer_id) AND (customers.customer_address_id = address_cityzip.address_id)
	GROUP BY customers.customer_id) AS A


# 8 - SELECT FROM WHERE NOT and IN
# Gives customers that dont pay in credit.
SELECT customer_name
FROM `customers`
WHERE customer_name NOT IN (
	SELECT customer_name
	FROM `customers`
	WHERE payment_method_code = 1
);

# 9 - SET COMMAND and WHERE (nontrivial) 10 - UPDATE with WHERE (nontrivial)
UPDATE pizzas_ordered
SET total_pizza_price='15.95'
WHERE total_pizza_price > '16.00'

# 11 - CREATE USER
CREATE USER joshfermin@localhost IDENTIFIED BY 'password';
GRANT ALL ON pizzahut_normalized.* TO joshfermin@localhost;

# 12 - DROP USER
DROP USER joshfermin@localhost;

# 13 - START TRANSACTION and a ROLLBACK
START TRANSACTION; # or BEGIN
UPDATE pizzas_ordered 
SET total_pizza_price = '10.00'
WHERE total_pizza_price < '15.50';
SELECT * FROM pizzas_ordered;

ROLLBACK;
SELECT * FROM pizzas_ordered










