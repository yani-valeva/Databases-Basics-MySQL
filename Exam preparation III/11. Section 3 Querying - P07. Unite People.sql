(SELECT e.`first_name`, c.`city_name`
FROM `employees` AS e
INNER JOIN `branches` AS b
ON e.`branch_id` = b.`branch_id`
INNER JOIN `cities` AS c
ON b.`city_id` = c.`city_id`
LIMIT 3)
UNION
(SELECT cm.`first_name`, ct.`city_name`
FROM `customers` AS cm
INNER JOIN `cities` AS ct
ON cm.`city_id` = ct.`city_id`
LIMIT 3);