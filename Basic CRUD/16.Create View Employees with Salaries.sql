CREATE VIEW `v_employees_salaries` AS
SELECT e.`first_name`, e.`last_name`, e.`salary`
FROM `employees` AS e;