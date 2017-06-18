-- first option
SELECT MIN(avg_s.`avg_sal`) AS 'min_average_salary'
FROM
(SELECT e.`department_id`, AVG(e.`salary`) AS 'avg_sal'
FROM `employees` AS e
GROUP BY e.`department_id`) AS avg_s;

-- second option
SELECT AVG(e.`salary`) AS 'min_average_salary'
FROM `employees` AS e
GROUP BY e.`department_id`
ORDER BY min_average_salary
LIMIT 1;
