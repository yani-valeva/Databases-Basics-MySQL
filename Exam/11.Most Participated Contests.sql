-- 3/10
SELECT c.`id`, c.name, us_c.`contests` AS 'contestants'
FROM `contests` AS c
INNER JOIN
(SELECT uc.`contest_id`, COUNT(uc.`user_id`) AS 'contests'
FROM `users_contests` AS uc
GROUP BY uc.`contest_id`
ORDER BY `contests` DESC
LIMIT 5) AS us_c
ON c.`id` = us_c.`contest_id`
ORDER BY us_c.`contests`,  c.`id`;