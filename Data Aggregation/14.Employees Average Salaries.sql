CREATE TABLE `employee`
SELECT *
FROM `employees` AS es
WHERE es.`salary` > 30000;
DELETE FROM `employee`
WHERE `manager_id` = 42;
UPDATE `employee`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;
SELECT `department_id`, AVG(`salary`) AS 'manager_id'
FROM `employee`
GROUP BY `department_id`
ORDER BY `department_id`;
