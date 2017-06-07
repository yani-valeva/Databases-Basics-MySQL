SELECT e.`first_name`, e.`last_name`, e.`department_id`
FROM `employees` AS e,
(SELECT e.`department_id`, AVG(e.`salary`) AS 'avg_sal'
FROM `employees` AS e
GROUP BY e.`department_id`) AS avg_sal_res
WHERE e.`department_id` = avg_sal_res.`department_id` AND e.`salary` > avg_sal_res.`avg_sal`
ORDER BY e.`department_id`
LIMIT 10;