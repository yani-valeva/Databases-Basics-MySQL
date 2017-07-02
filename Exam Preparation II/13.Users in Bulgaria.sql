SELECT u.`nickname`, c.`title`, l.`latitude`, l.`longitude`
FROM `chats` AS c
INNER JOIN `users_chats` AS uc
ON c.`id` = uc.`chat_id`
INNER JOIN `users` AS u
ON uc.`user_id` = u.`id`
INNER JOIN `locations` AS l
ON u.`location_id` = l.`id`
WHERE l.`latitude` BETWEEN 41.139999 AND 44.129999
AND l.`longitude` BETWEEN 22.209999 AND 28.359999
ORDER BY c.`title`;