-- first option
DELETE l
FROM `locations` AS l
LEFT JOIN `users` as u
ON l.`id` = u.`location_id`
WHERE u.`id` IS NULL;

-- second option
DELETE l
FROM `locations` AS l 
WHERE l.`id` NOT IN(SELECT u.`location_id` 
						FROM `users` AS u 
                        GROUP BY u.`location_id`);