UPDATE `employees` AS e
SET e.`manager_id` = 
CASE 
	WHEN e.`employee_id` BETWEEN 2 AND 10 THEN 1
    WHEN e.`employee_id` BETWEEN 12 AND 20 THEN 11
    WHEN e.`employee_id` BETWEEN 22 AND 30 THEN 21
    WHEN e.`employee_id` IN(11, 21) THEN 1
    END;