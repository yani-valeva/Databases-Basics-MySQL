SELECT r.`flight_id`, r.`departure_time`, r.`arrival_time`, r.`origin`, r.`destination`
FROM
(SELECT f.`flight_id`, f.`departure_time`, f.`arrival_time`, a.`airport_name` AS 'origin', ar.`airport_name` AS 'destination'
FROM `flights` AS f
INNER JOIN `airports` AS a
ON f.`origin_airport_id` = a.`airport_id`
INNER JOIN `airports` AS ar
ON f.`destination_airport_id` = ar.`airport_id`
WHERE f.`status` = 'Departing'
ORDER BY f.`departure_time` DESC
LIMIT 5) AS r
ORDER BY r.`departure_time`, r.`flight_id`;