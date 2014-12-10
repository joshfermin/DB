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

CREATE TABLE ref_payment_methods
(
	payment_method_code INT NOT NULL,
    payment_method_description TEXT,
    PRIMARY KEY (payment_method_code)
);

CREATE TABLE addresses
(
    address_id INT NOT NULL,
    city VARCHAR(20),
    zip INT,
    state VARCHAR(20),
    country VARCHAR(20),
    PRIMARY KEY (address_id)
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

CREATE TABLE orders
(
	order_id INT NOT NULL,
    customer_id INT NOT NULL,
    delivered_by_employee_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    employee_phone VARCHAR(50),
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES addresses(customer_id)
    FOREIGN KEY (delivered_by_employee_id) REFERENCES employees(employee_id)
);



-- http://www.netthruoffice.com/doc/images/pizza_deliveries_dezign.gif


