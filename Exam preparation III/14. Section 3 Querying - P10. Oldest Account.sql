SELECT c.`customer_id`, c.`first_name`, a.`start_date`
FROM `customers` AS c
INNER JOIN `accounts` AS a
ON c.`customer_id` = a.`customer_id`
WHERE a.`start_date` = (SELECT a.`start_date`
							FROM `accounts` AS a
							ORDER BY a.`start_date`
							LIMIT 1);