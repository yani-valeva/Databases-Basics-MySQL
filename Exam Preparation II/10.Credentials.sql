SELECT u.`nickname`, c.`email`, c.`password` 
FROM `users` AS u
INNER JOIN `credentials` AS c
ON u.`credential_id` = c.`id`
WHERE c.`email` LIKE '%co.uk'
ORDER BY c.`email`;
