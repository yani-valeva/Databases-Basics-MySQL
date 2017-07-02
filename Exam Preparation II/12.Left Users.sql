SELECT DISTINCT m.`id`, m.`chat_id`, m.`user_id`
FROM `chats` AS c
LEFT JOIN `messages` AS m
ON c.`id` = m.`chat_id`
LEFT JOIN `users` AS u
ON m.`user_id` = u.`id`
LEFT JOIN `users_chats` AS us
ON u.`id` = us.`user_id`
WHERE c.`id` = 17 AND u.`id` NOT IN (SELECT uc.`user_id`
												FROM `users` AS u
												LEFT JOIN `users_chats` AS uc
												ON u.`id` = uc.`user_id`
												WHERE uc.`chat_id` = 17)
ORDER BY m.`id` DESC;