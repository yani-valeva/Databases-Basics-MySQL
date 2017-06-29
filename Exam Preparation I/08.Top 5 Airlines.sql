SELECT DISTINCT a.`airline_id`, a.`airline_name`, a.`nationality`, a.`rating`
FROM `airlines` AS a
INNER JOIN `flights` AS f
ON a.`airline_id` = f.`airline_id`
ORDER BY a.`rating` DESC, a.`airline_id`
LIMIT 5;