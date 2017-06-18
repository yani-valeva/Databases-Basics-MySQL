SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, es.`first_name` AS 'manager_name'
FROM `employees` AS e
INNER JOIN `employees` AS es
ON e.`manager_id` = es.`employee_id`
WHERE e.`manager_id` IN(3,7)
ORDER BY e.`first_name`;