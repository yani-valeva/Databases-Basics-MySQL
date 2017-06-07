SELECT e.`department_id`, MAX(e.`salary`) AS 'third_highest_salary'
FROM `employees` AS e, (SELECT e.`department_id`, MAX(e.`salary`) AS 'second_max'
    							FROM `employees` AS e, (SELECT e.department_id, MAX(e.salary) AS 'max_salary'
						 									  FROM `employees` AS e
															  GROUP BY e.`department_id`
						 									 ) AS max_sal
    							WHERE e.`department_id` = max_sal.`department_id`
            						AND e.`salary` < max_sal.`max_salary`
  								  GROUP BY e.`department_id`
							) AS sec_max
WHERE e.`department_id` = sec_max.`department_id` AND e.`salary` < sec_max.`second_max`
GROUP BY e.`department_id`
ORDER BY e.`department_id`;