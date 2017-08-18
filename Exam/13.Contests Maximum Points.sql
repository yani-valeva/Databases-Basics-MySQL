SELECT c.`id`, c.`name`, SUM(p.`points`) AS 'maximum_points'
FROM `contests` AS c
INNER JOIN `problems` AS p
ON c.`id` = p.`contest_id`
GROUP BY c.`id`
ORDER BY `maximum_points` DESC, c.`id` ASC;