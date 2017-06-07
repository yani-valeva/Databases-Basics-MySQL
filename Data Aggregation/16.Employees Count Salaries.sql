SELECT COUNT(e.`salary`) AS 'count'
FROM `employees` AS e
WHERE e.`manager_id` IS NULL;