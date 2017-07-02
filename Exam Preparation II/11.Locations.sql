SELECT u.`id`, u.`nickname`, u.`age`
FROM `users` AS u
LEFT JOIN `locations` AS l
ON u.`location_id` = l.`id`
WHERE l.`id` IS NULL
ORDER BY u.`id`;