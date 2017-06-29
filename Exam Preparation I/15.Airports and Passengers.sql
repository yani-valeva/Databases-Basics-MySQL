SELECT a.`airport_id`, a.`airport_name`, COUNT(c.`customer_id`) AS 'passengers'
FROM `airports` AS a
INNER JOIN `flights` AS f
ON a.`airport_id` = f.`origin_airport_id`
INNER JOIN `tickets` AS t
ON f.`flight_id` = t.`flight_id`
INNER JOIN `customers` AS c
ON t.`customer_id` = c.`customer_id`
WHERE f.`status` = 'Departing'
GROUP BY a.`airport_id`, a.`airport_name`
HAVING COUNT(c.`customer_id`) > 0
ORDER BY a.`airport_id`;