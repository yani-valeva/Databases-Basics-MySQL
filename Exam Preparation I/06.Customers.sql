SELECT c.`customer_id`, CONCAT(c.`first_name`, ' ', c.`last_name`) AS 'full_name', c.`gender`
FROM `customers` AS c
ORDER BY `full_name`, c.`customer_id`;