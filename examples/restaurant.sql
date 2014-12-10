-- create the database
DROP DATABASE IF EXISTS restuaruant;
CREATE DATABASE restaurant;

-- select the database
USE restaurant;

-- creating tables:
CREATE TABLE customers
(
    customer_id INT NOT NULL,
    payment_method_code INT NOT NULL,
    customer_address_id INT NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (payment_method_code) REFERENCES ref_payment_methods(payment_method_code),
    FOREIGN KEY (customer_address_id) REFERENCES addresses(customer_address_id)
);
INSERT INTO customers VALUES
(10, 1, 10, 'Fred Customer', '222-111-1111'),
(11, 2, 11, 'Julie Jones', '222-222-2222'),
(12, 2, 12, 'Jim Baker', '222-333-3333'),
(13, 1, 13, 'Maria Anders', '222-444-4444'),
(14, 3, 14, 'Ana Trujillo', '222-555-5555');

CREATE TABLE ref_payment_methods
(
	payment_method_code INT NOT NULL,
    payment_method_description TEXT,
    PRIMARY KEY (payment_method_code)
);
INSERT INTO ref_payment_methods VALUES
(1 , 'CREDIT')
(2 , 'DEBIT')
(3 , 'CASH');

CREATE TABLE addresses
(
    address_id INT NOT NULL,
    city VARCHAR(20),
    zip INT,
    state VARCHAR(20),
    country VARCHAR(20),
    PRIMARY KEY (address_id)
);
INSERT INTO addresses
(

);

CREATE TABLE employees
(
	employee_id INT NOT NULL,
    employee_address_id INT NOT NULL,
    employee_name VARCHAR(50),
    employee_phone VARCHAR(50),
    PRIMARY KEY (employee_id),
    FOREIGN KEY (employee_address_id) REFERENCES addresses(employee_address_id)
);
INSERT INTO employees VALUES
(1, 1, 'John Doe', 		'111-111-1111'),
(2, 2, 'Cindy Smith', 	'111-222-2222'),
(3, 3, 'Elmer Jones', 	'111-333-3333'),
(4, 4, 'Ralph Watson', 	'111-444-4444'),
(5, 5, 'Paulo Locario', '111-555-5555'),
(6, 6, 'Louis B', 		'111-666-6666'),
(7, 7, 'Josh Fermin', 	'111-777-7777'),
(8, 8, 'Alex Campbell', '111-888-8888'),
(9, 9, 'Edward Zhu', 	'111-999-9999');

CREATE TABLE orders
(
	order_id INT NOT NULL,
    customer_id INT NOT NULL,
    delivered_by_employee_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    employee_phone VARCHAR(50),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES addresses(customer_id),
    FOREIGN KEY (delivered_by_employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);



CREATE TABLE vehicles
(
	vehicle_id INT NOT NULL,
	vehicle_type_code INT NOT NULL,
	vehicle_details TEXT,
	PRIMARY KEY (vehicle_id),
	FOREIGN KEY	(vehicle_type_code) REFERENCES vehicle_types(vehicle_type_code)
);

CREATE TABLE vehicle_types
(
	vehicle_type_code INT NOT NULL,
	vehicle_type_description TEXT,
	PRIMARY KEY (vehicle_type_code)
);


-- http://www.netthruoffice.com/doc/images/pizza_deliveries_dezign.gif


