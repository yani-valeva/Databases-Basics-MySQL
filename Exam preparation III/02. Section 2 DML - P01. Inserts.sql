INSERT INTO `deposit_types` (`deposit_type_id`, `name`)
VALUES (1, 'Time Deposit'), (2,	'Call Deposit'), (3, 'Free Deposit');

INSERT INTO `deposits` (`amount`, `start_date`, `deposit_type_id`, `customer_id`)
SELECT CASE
			WHEN c.`date_of_birth` > '1980-01-01' AND c.`gender` = 'M' THEN 1100
            WHEN c.`date_of_birth` > '1980-01-01' AND c.`gender` = 'F' THEN 1200
            WHEN c.`date_of_birth` <= '1980-01-01' AND c.`gender` = 'M' THEN 1600
			WHEN c.`date_of_birth` <= '1980-01-01' AND c.`gender` = 'F' THEN 1700
            END,
            '2016-10-12',
		CASE
			WHEN c.`customer_id` > 15 THEN 3
			WHEN c.`customer_id` % 2 <> 0 THEN 1
            WHEN c.`customer_id` % 2 = 0 THEN 2
			END,
            c.`customer_id`
FROM `customers` AS c
WHERE c.customer_id < 20;

INSERT INTO `employees_deposits` (`employee_id`, `deposit_id`)
VALUES (15, 4), (20, 15), (8, 7), (4, 8), (3, 13), (3, 8), (4, 10), (10, 1), (13, 4), (14, 9);