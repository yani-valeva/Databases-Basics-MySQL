SELECT p.`id`, CONCAT(ct.`name`, ' - ', c.`name`, ' - ', p.`name`) AS 'full_path'
FROM `problems` AS p
INNER JOIN `contests` AS c
ON p.`contest_id` = c.`id`
INNER JOIN `categories` AS ct
ON c.`category_id` = ct.`id`
ORDER BY p.`id`;
