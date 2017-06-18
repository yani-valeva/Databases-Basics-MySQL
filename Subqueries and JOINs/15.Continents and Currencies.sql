SELECT c_usdg.`continent_code`, c_usdg.`currency_code`, c_usdg.`cur_usage` AS 'currency_usage'
FROM
(SELECT con.`continent_code`, c.`currency_code`, COUNT(*) AS 'cur_usage'
FROM `continents`AS con
INNER JOIN `countries` As c
ON con.`continent_code` = c.`continent_code`
GROUP BY con.`continent_code`, c.`currency_code`) AS c_usdg
INNER JOIN
(SELECT us.`continent_code`, MAX(us.`cur_usage`) AS 'currency_usage'
FROM
(SELECT con.`continent_code`, c.`currency_code`, COUNT(*) AS 'cur_usage'
FROM `continents`AS con
INNER JOIN `countries` As c
ON con.`continent_code` = c.`continent_code`
GROUP BY con.`continent_code`, c.`currency_code`) AS us
GROUP BY us.`continent_code`) AS c_us
ON c_usdg.`continent_code` = c_us.`continent_code`
WHERE c_usdg.`cur_usage` = c_us.`currency_usage` AND c_usdg.`cur_usage` > 1
ORDER BY c_usdg.`continent_code`, c_usdg.`currency_code`;