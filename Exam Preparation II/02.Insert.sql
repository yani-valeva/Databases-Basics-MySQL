INSERT INTO `messages` (content, sent_on, chat_id, user_id)
SELECT d.`content`, d.`sent_on`, d.`chat_id`, d.`user_id`
FROM
(SELECT CONCAT(u.`age`, '-', u.`gender`, '-', l.`latitude`, '-', l.`longitude`) AS 'content',
DATE_FORMAT('2016-12-15', '%Y-%m-%d') AS 'sent_on',
CASE 
WHEN u.`gender` = 'F' THEN CEIL(SQRT(u.`age` * 2))
WHEN u.`gender` = 'M' THEN CEIL(POW(u.`age` / 18, 3))
END AS 'chat_id',
u.`id` AS 'user_id'
FROM `users` AS u
JOIN `locations` AS l
ON l.`id` = u.`location_id`
WHERE u.`id` BETWEEN 10 AND 20) AS d;