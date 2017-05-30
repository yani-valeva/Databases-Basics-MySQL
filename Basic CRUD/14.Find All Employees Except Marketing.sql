-- First option
SELECT `first_name`, `last_name`
FROM `employees`
WHERE `department_id` != 4;

-- Second option
SELECT `first_name`, `last_name`
FROM `employees`
WHERE `department_id` NOT IN (4);

-- Third option
SELECT `first_name`, `last_name`
FROM `employees`
WHERE `department_id` NOT LIKE 4;
