DELIMITER $$
CREATE TRIGGER `tr_insert_employees`
AFTER INSERT
ON `employees`
FOR EACH ROW
BEGIN
	INSERT INTO `employees_loans` (`employee_id`, `loan_id`)
	VALUES (NEW.`employee_id`, (SELECT el.`loan_id`
									FROM `employees` AS e
									INNER JOIN `employees_loans` AS el
									ON e.`employee_id` = el.`employee_id`
									WHERE e.`employee_id` = NEW.`employee_id` - 1));
END $$

DELIMITER ;

INSERT INTO `employees` (`employee_id`, `first_name`, `hire_date`, `salary`, `branch_id`)
VALUES (31, 'Jake', '20161212' , 500, 2);

SELECT *
FROM `employees`;

SELECT *
FROM `employees_loans` AS el
WHERE el.`employee_id` = 31;