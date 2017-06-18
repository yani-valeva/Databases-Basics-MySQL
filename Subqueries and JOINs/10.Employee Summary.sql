SELECT e.`employee_id`, CONCAT(e.`first_name`, " ", e.`last_name`) AS 'employee_name', 
CONCAT(es.`first_name`, " ", es.`last_name`) AS 'manager_name', d.`name` AS 'department_name'
FROM `departments` AS d
INNER JOIN `employees` AS e
ON d.`department_id` = e.`department_id`
INNER JOIN `employees` AS es
ON e.`manager_id` = es.`employee_id`
ORDER BY e.`employee_id`
LIMIT 5;