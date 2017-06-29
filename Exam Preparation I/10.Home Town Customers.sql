SELECT DISTINCT c.`customer_id`, CONCAT(c.`first_name`, ' ', c.`last_name`) AS 'full_name', t.`town_name` AS 'home_town'
FROM `customers` AS c
INNER JOIN `towns` AS t
ON c.`home_town_id` = t.`town_id`
INNER JOIN `tickets` AS tc
ON c.`customer_id` = tc.`customer_id`
INNER JOIN `flights` AS f
ON tc.`flight_id` = f.`flight_id`
AND f.`status` = 'Departing'
INNER JOIN `airports` AS a
ON f.`origin_airport_id` = a.`airport_id` 
AND c.`home_town_id` = a.`town_id`
ORDER BY c.`customer_id`;