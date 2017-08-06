SELECT c.`customer_id`, c.`first_name`, c.`last_name`, c.`gender`, ct.`city_name`
FROM `customers` AS c
INNER JOIN `cities` AS ct
ON c.`city_id` = ct.`city_id`
WHERE (c.`last_name` LIKE 'Bu%' OR c.`first_name` LIKE '%a') AND CHAR_LENGTH(ct.`city_name`) >= 8
ORDER BY c.`customer_id`;