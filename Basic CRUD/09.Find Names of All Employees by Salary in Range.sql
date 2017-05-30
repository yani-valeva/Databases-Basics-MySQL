SELECT e.first_name, e.last_name, e.job_title AS 'JobTitle'
FROM `employees` AS e
WHERE e.salary BETWEEN 20000 AND 30000;