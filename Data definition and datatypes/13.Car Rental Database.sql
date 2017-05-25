CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE categories (
    id INT NOT NULL AUTO_INCREMENT,
    category VARCHAR(30) NOT NULL,
    daily_rate FLOAT,
    weekly_rate FLOAT,
    monthly_rate FLOAT,
    weekend_rate FLOAT,
    CONSTRAINT pk_categories PRIMARY KEY (id)
);

CREATE TABLE cars (
    id INT NOT NULL AUTO_INCREMENT,
    plate_number VARCHAR(10) NOT NULL,
    make VARCHAR(20),
    model VARCHAR(20),
    car_year DATE,
    category_id INT,
    doors INT(1),
    picture BLOB,
    car_condition TEXT,
    available TINYINT,
    CONSTRAINT pk_cars PRIMARY KEY (id)
);

CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    title VARCHAR(50),
    notes TEXT,
    CONSTRAINT pk_employees PRIMARY KEY (id)
);

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    driver_licence_number BIGINT,
    full_name VARCHAR(50) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(20),
    zip_code INT,
    notes TEXT,
    CONSTRAINT pk_customers PRIMARY KEY (id)
);

CREATE TABLE rental_orders (
    id INT NOT NULL AUTO_INCREMENT,
    employee_id INT,
    customer_id INT,
    car_id INT,
    car_condition TEXT,
    tank_level DOUBLE,
    kilometrage_start DOUBLE,
    kilometrage_end DOUBLE,
    total_kilometrage DOUBLE,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied FLOAT(2),
    tax_rate FLOAT(2),
    order_status TINYINT,
    notes TEXT,
    CONSTRAINT pk_rental_orders PRIMARY KEY (id)
);

INSERT INTO categories (category, daily_rate, monthly_rate)
VALUES ('Manual', 15.9, 477), ('Automatic', 7.8, 234.8), ('Cargo Van', 19.1, 553.4);

INSERT INTO cars (plate_number, make, model, category_id, doors, car_condition, available)
VALUES ('CA2233EM', 'Ford', 'Fiesta', 2, 5, 'The car is rented with full tank and the fuel consumption is on renter’s expenses.', TRUE),
('EH9928KL', 'Ford', 'Transit', 3, 5, 'There is an option to prepay a full tank of fuel at the beginning of the rental at the price at the gas stations.', FALSE),
('OB6281DK', 'Ford', 'Mondeo', 1, 5, 'The car is rented with full tank and the fuel consumption is on renter’s expenses. If you return the car with less fuel, the missing fuel will be charged € 3.50 per liter.', TRUE);

INSERT INTO employees (first_name, last_name)
VALUES ('Plamen', 'Petrov'), ('Mihail', 'Mihailov'), ('Petar', 'Petrov');

INSERT INTO customers (full_name, city)
VALUES ('Ivanov', 'Sofia'), ('Kisiov', 'Pleven'), ('Belev', 'Lovech');

INSERT INTO rental_orders (employee_id, customer_id, car_id, order_status)
VALUES (1, 2, 3, TRUE), (3, 1, 1, TRUE), (2, 3, 2, FALSE);