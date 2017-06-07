SELECT aws.`deposit_group`
FROM
    (SELECT wd.`deposit_group`,
            AVG(wd.`magic_wand_size`) AS 'average_wand_size'
    FROM `wizzard_deposits` AS wd
    GROUP BY wd.`deposit_group`
    ORDER BY `average_wand_size`) AS aws
LIMIT 1;