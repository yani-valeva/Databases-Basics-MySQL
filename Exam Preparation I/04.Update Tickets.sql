UPDATE `tickets` AS t
INNER JOIN `flights` AS f
ON t.`flight_id` = f.`flight_id`
INNER JOIN `airlines` AS a
ON f.`airline_id` = a.`airline_id`
SET t.`price` = t.`price` + (t.`price` * 0.5)
WHERE a.`rating` = (SELECT ar.`rating`
						FROM `airlines` AS ar
						ORDER BY ar.`rating` DESC
						LIMIT 1);