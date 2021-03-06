CREATE DATABASE `online_store`;

USE `online_store`;

CREATE TABLE `cities` (
    `city_id` INT(11),
    `name` VARCHAR(50),
    CONSTRAINT `pk_cities` PRIMARY KEY (`city_id`)
);

CREATE TABLE `customers` (
    `customer_id` INT(11),
    `name` VARCHAR(50),
    `birthday` DATE,
    `city_id` INT(11),
    CONSTRAINT `pk_customers` PRIMARY KEY (`customer_id`),
    CONSTRAINT `fk_customers_cities` FOREIGN KEY (`city_id`)
        REFERENCES `cities` (`city_id`)
);

CREATE TABLE `orders` (
    `order_id` INT(11),
    `customer_id` INT(11),
    CONSTRAINT `pk_orders` PRIMARY KEY (`order_id`),
    CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`)
        REFERENCES `customers` (`customer_id`)
);

CREATE TABLE `item_types` (
    `item_type_id` INT(11),
    `name` VARCHAR(50),
    CONSTRAINT `pk_item_types` PRIMARY KEY (`item_type_id`)
);

CREATE TABLE `items` (
    `item_id` INT(11),
    `name` VARCHAR(50),
    `item_type_id` INT(11),
    CONSTRAINT `pk_items` PRIMARY KEY (`item_id`),
    CONSTRAINT `fk_items_item_types` FOREIGN KEY (`item_type_id`)
        REFERENCES `item_types` (`item_type_id`)
);

CREATE TABLE `order_items` (
    `order_id` INT(11),
    `item_id` INT(11),
    CONSTRAINT `pk_order_items` PRIMARY KEY (`order_id` , `item_id`),
    CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`)
        REFERENCES `orders` (`order_id`),
    CONSTRAINT `fk_order_items_items` FOREIGN KEY (`item_id`)
        REFERENCES `items` (`item_id`)
);