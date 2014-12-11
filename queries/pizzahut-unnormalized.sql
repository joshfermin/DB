-- create the database
DROP DATABASE IF EXISTS pizzahut;
CREATE DATABASE pizzahut;

-- select the database
USE pizzahut;

-- creating tables:
CREATE TABLE ref_payment_methods
(
    -- payment_method_code determines type
    payment_method_code INT NOT NULL,
    payment_method_type TEXT,
    PRIMARY KEY (payment_method_code)
);

INSERT INTO ref_payment_methods VALUES
(1 , 'CREDIT'),
(2 , 'DEBIT'),
(3 , 'CASH');

CREATE TABLE addresses
(
    -- address_id determines city, zip, state
    address_id INT NOT NULL,
    city VARCHAR(20),
    zip VARCHAR(20),
    state VARCHAR(20),
    PRIMARY KEY (address_id)
);
INSERT INTO addresses VALUES
(1, 'Boulder', '80303', 'CO'),
(2, 'Boulder', '80304', 'CO'),
(3, 'Boulder', '80305', 'CO'),
(4, 'Broomfield', '80021', 'CO'),
(5, 'Boulder', '80305', 'CO'),
(6, 'Boulder', '80303', 'CO'),
(7, 'Boulder', '80301', 'CO'),
(8, 'Boulder', '80302', 'CO'),
(9, 'Boulder', '80303', 'CO'),
(10, 'Broomfield', '800020', 'CO'),
(11, 'Broomfield', '800021', 'CO'),
(12, 'Broomfield', '800020', 'CO'),
(13, 'Broomfield', '800023', 'CO'),
(14, 'Broomfield', '800020', 'CO');

CREATE TABLE employees
(
    -- employee_id determines address, name, phone
    employee_id INT NOT NULL,
    employee_address_id INT REFERENCES addresses(employee_address_id),
    employee_name VARCHAR(50),
    employee_phone VARCHAR(50),
    PRIMARY KEY (employee_id)
);
INSERT INTO employees VALUES
(1, 1, 'John Doe',      '111-111-1111'),
(2, 2, 'Cindy Smith',   '111-222-2222'),
(3, 3, 'Elmer Jones',   '111-333-3333'),
(4, 4, 'Ralph Watson',  '111-444-4444'),
(5, 5, 'Paulo Locario', '111-555-5555'),
(6, 6, 'Louis Bouddhou','111-666-6666'),
(7, 7, 'Josh Fermin',   '111-777-7777'),
(8, 8, 'Alex Campbell', '111-888-8888'),
(9, 9, 'Edward Zhu',    '111-999-9999');

CREATE TABLE customers
(
    -- FD customer_id determines address/name/phone
    customer_id INT NOT NULL,
    payment_method_code INT REFERENCES ref_payment_methods(payment_method_code),
    customer_address_id INT REFERENCES addresses(address_id),
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);
INSERT INTO customers VALUES
(10, 1, 10, 'Fred Customer', '222-111-1111'),
(11, 2, 11, 'Julie Jones', '222-222-2222'),
(12, 2, 12, 'Jim Baker', '222-333-3333'),
(13, 1, 13, 'Maria Anders', '222-444-4444'),
(14, 3, 14, 'Ana Trujillo', '222-555-5555');


CREATE TABLE vehicles
(
    vehicle_id INT REFERENCES vehicle_types(vehicle_type_code),
    vehicle_license_number VARCHAR(20),
    PRIMARY KEY (vehicle_id)
);
INSERT INTO vehicles VALUES
(1, '123-ABC'),
(2, '456-DEF'),
(3, '789-GHI');

CREATE TABLE vehicle_types
(
    vehicle_type_code INT NOT NULL,
    vehicle_type_description TEXT,
    PRIMARY KEY (vehicle_type_code)
);
INSERT INTO vehicle_types VALUES
(1, '2008 Honda Civic'),
(2, '2011 BMW 128i'),
(3, '2007 Mitsubishi Eclipse');

CREATE TABLE orders
(
    -- order_id detmines 
    order_id INT NOT NULL REFERENCES pizzas_ordered(order_id),
    customer_id INT NOT NULL  REFERENCES addresses(customer_id),
    delivered_by_employee_id INT NOT NULL REFERENCES employees(employee_id),
    vehicle_id INT NOT NULL REFERENCES vehicles(vehicle_id),
    total_order_price DECIMAL(2,2) NOT NULL,
    PRIMARY KEY (order_id)
);
INSERT INTO orders VALUES
(1, 11, 1, 1, '12.93'),
(2, 14, 5, 1, '10.95'),
(3, 12, 8, 2, '18.95'),
(4, 13, 6, 3, '15.25'),
(5, 10, 7, 2, '10.95');


-- MVD - table's only pk is all 3 attributes.
CREATE TABLE employee_delivery_area
(
    delivered_by_employee VARCHAR(50),
    pizza_type VARCHAR(20),
    area VARCHAR(20)
);
INSERT INTO employee_delivery_area VALUES
('Alex Campbell', 'Pepperoni', 'Boulder'),
('Alex Campbell', 'Cheese', 'Boulder'),
('John Doe', 'Pepperoni', 'Broomfield'),
('John Doe', 'Supreme', 'Broomfield');

CREATE TABLE pizzas_ordered
(
    order_id INT NOT NULL,
    pizza_id INT NOT NULL REFERENCES ref_base_types(pizza_id),
    total_pizza_price DECIMAL(2,2) NOT NULL,
    PRIMARY KEY (order_id)
);
INSERT INTO pizzas_ordered VALUES
(1, 2, '12.93'),
(2, 1, '10.95'),
(3, 4, '18.95'),
(4, 3, '15.25'),
(5, 1, '10.95');


CREATE TABLE pizza_details
(
    pizza_id INT NOT NULL,
    pizza_description TEXT,
    PRIMARY KEY (pizza_id)
);
INSERT INTO pizza_details VALUES
(1, 'Supreme'),
(2, 'Pepperoni'),
(3, 'Meat Lovers'),
(4, 'Cheese');


-- loosely following:
-- http://www.netthruoffice.com/doc/images/pizza_deliveries_dezign.gif


