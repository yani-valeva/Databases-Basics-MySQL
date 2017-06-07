SELECT SUM(d.`difference`) AS 'difference'
FROM
(SELECT wd1.`first_name` AS 'host_wizard', wd1.`deposit_amount` AS 'host_wizard_deposit', wd2.`first_name` AS 'guest_wizard', wd2.`deposit_amount` AS 'guest_wizard_deposit', wd1.`deposit_amount` - wd2.`deposit_amount` AS 'difference'
FROM `wizzard_deposits` AS wd1, `wizzard_deposits` AS wd2 
WHERE wd1.`id` + 1 = wd2.`id`) AS d;