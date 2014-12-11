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
SELECT 
	COUNT(orders.order_id) AS NumberOFOrders,
	customers.customer_id,
	customers.customer_name
FROM 
	`orders`, `customers`
WHERE 
	orders.customer_id = customers.customer_id
GROUP BY 
	customers.customer_name

# 6 - SELECT FROM WHERE GROUP BY HAVING

	


