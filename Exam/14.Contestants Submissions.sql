SELECT c.`id`, c.`name`, COUNT(s.`id`) AS 'submissions'
FROM `contests` AS c
LEFT JOIN `problems` AS p
ON c.`id` = p.`contest_id`
LEFT JOIN `submissions` AS s
ON p.`id` = s.`problem_id`
WHERE s.`user_id` IN (SELECT uc.`user_id`
					FROM `users_contests` AS uc
					WHERE uc.`contest_id` = c.`id`)
GROUP BY c.`id`, c.`name`
ORDER BY `submissions` DESC, c.`id` ASC;