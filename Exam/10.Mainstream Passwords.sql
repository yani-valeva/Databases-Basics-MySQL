SELECT u.`id`, u.`username`, u.`password`
FROM `users` AS u
WHERE u.`password` IN (SELECT ur.`password`
						FROM `users` AS ur WHERE ur.`id` != u.`id`)
ORDER BY u.`username`, u.`id`;