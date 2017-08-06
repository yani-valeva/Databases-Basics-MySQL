SELECT c.`customer_id`, c.`height`
FROM `customers` AS c
LEFT JOIN `accounts` AS a
ON c.`customer_id` = a.`customer_id`
WHERE a.`account_id` IS NULL AND c.`height` BETWEEN 1.74 AND 2.04;
