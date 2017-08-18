SELECT c.`id`,c.`name`
FROM `categories` AS c
WHERE c.`id` NOT IN (SELECT ct.`parent_id` FROM `categories` AS ct WHERE ct.`parent_id` IS NOT NULL)
ORDER BY c.`name`, c.`id`;