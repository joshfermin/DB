-- create the database
DROP DATABASE IF EXISTS pizzahut;
CREATE DATABASE pizzahut;

-- select the database
USE pizzahut;

-- creating tables:
CREATE TABLE customers
(
    -- FD customer_id determines address/name/phone
    -- method code determines method type
    customer_id INT NOT NULL,
    payment_method_code INT,
    customer_address_id INT REFERENCES addresses(address_id),
    payment_method_type TEXT,
    customer_name VARCHAR(50) NOT NULL,
    customer_phone VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);
INSERT INTO customers VALUES
(10, 1, 10, 'CREDIT',  'Fred Customer', '222-111-1111'),
(11, 2, 11, 'DEBIT', 'Julie Jones', '222-222-2222'),
(12, 2, 12, 'DEBIT', 'Jim Baker', '222-333-3333'),
(13, 1, 13, 'CREDIT', 'Maria Anders', '222-444-4444'),
(14, 3, 14, 'CASH', 'Ana Trujillo', '222-555-5555');

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
(10, 'Broomfield', '80020', 'CO'),
(11, 'Broomfield', '80021', 'CO'),
(12, 'Broomfield', '80020', 'CO'),
(13, 'Broomfield', '80023', 'CO'),
(14, 'Broomfield', '80020', 'CO');

CREATE TABLE employees
(
    -- employee_id determines address, name, phone
    employee_id INT NOT NULL,
    employee_address_id INT REFERENCES addresses(employee_address_id),
    employee_name VARCHAR(50),
    employee_phone VARCHAR(50),
    city VARCHAR(20),
    zip VARCHAR(20),
    PRIMARY KEY (employee_id)
);
INSERT INTO employees VALUES
(1, 1, 'John Doe',      '111-111-1111', 'Boulder', 80303),
(2, 2, 'Cindy Smith',   '111-222-2222', 'Boulder', 80303),
(3, 3, 'Elmer Jones',   '111-333-3333', 'Boulder', 80303),
(4, 4, 'Ralph Watson',  '111-444-4444', 'Boulder', 80303),
(5, 5, 'Sheefali Tewari', '111-555-5555', 'Broomfield', 80020),
(6, 6, 'Louis Bouddhou','111-666-6666', 'Boulder', 80304),
(7, 7, 'Josh Fermin',   '111-777-7777', 'Boulder', 80304),
(8, 8, 'Alex Campbell', '111-888-8888', 'Boulder', 80304),
(9, 9, 'Edward Zhu',    '111-999-9999', 'Boulder', 80304);

CREATE TABLE vehicles
(
    vehicle_id INT,
    vehicle_license_number VARCHAR(20),
    vehicle_type_description TEXT,
    PRIMARY KEY (vehicle_id)
);
INSERT INTO vehicles VALUES
(1, '123-ABC', '2008 Honda Civic'),
(2, '456-DEF', '2011 BMW 128i'),
(3, '789-GHI', '2007 Mitsubishi Eclipse');

CREATE TABLE orders
(
    -- order_id detmines 
    order_id INT NOT NULL REFERENCES pizzas_ordered(order_id),
    customer_id INT NOT NULL  REFERENCES addresses(customer_id),
    delivered_by_employee_id INT NOT NULL REFERENCES employees(employee_id),
    vehicle_id INT NOT NULL REFERENCES vehicles(vehicle_id),
    pizza_id INT NOT NULL REFERENCES pizza_ordered(pizza_id),
    total_order_price DECIMAL(2,2) NOT NULL,
    area VARCHAR(20),
    PRIMARY KEY (order_id)
);
INSERT INTO orders VALUES
(1, 11, 1,  1, 1, '12.93', 'Boulder'),
(2, 14, 5,  1, 2, '10.95', 'Broomfield'),
(3, 12, 8,  2, 3, '18.95', 'Broomfield'),
(4, 13, 6,  3, 4, '15.25', 'Broomfield'),
(5, 10, 7,  2, 2, '10.95', 'Broomfield'),
(6, 11, 5,  1, 2, '10.95', 'Boulder'),
(7, 11, 1,  1, 1, '12.93', 'Boulder'),
(8, 12, 5,  2, 4, '15.25', 'Boulder'),
(9, 12, 5,  2, 1, '12.93', 'Boulder'),
(10, 11, 1, 1, 1, '12.93', 'Boulder'),
(11, 11, 6, 2, 3, '18.95', 'Boulder'),
(12, 14, 5, 1, 1, '12.93', 'Boulder'),
(13, 14, 3, 2, 1, '12.93', 'Boulder'),
(14, 12, 2, 1, 2, '10.95', 'Boulder'),
(15, 12, 7, 1, 1, '12.93', 'Boulder'),
(16, 13, 1, 3, 1, '12.93', 'Boulder'),
(17, 10, 1, 1, 3, '18.95', 'Boulder'),
(18, 11, 1, 1, 1, '12.93', 'Boulder'),
(19, 11, 1, 1, 1, '12.93', 'Boulder'),
(20, 11, 1, 1, 1, '12.93', 'Boulder');


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
    pizza_id INT NOT NULL REFERENCES ref_base_types(pizza_id),
    pizza_description TEXT,
    total_pizza_price DECIMAL(2,2) NOT NULL,
    PRIMARY KEY (pizza_id)
);
INSERT INTO pizzas_ordered VALUES
(1, '12.93', 'Pepperoni'),
(2, '10.95', 'Supreme'),
(3, '18.95', 'Cheese'),
(4, '15.25', 'Meat Lovers'),
(5, '10.95', 'Supreme');


-- loosely following:
-- http://www.netthruoffice.com/doc/images/pizza_deliveries_dezign.gif

