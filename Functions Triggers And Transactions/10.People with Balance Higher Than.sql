-- first option
DELIMITER $$
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than`(IN `givenSum` DECIMAL(19, 4))
BEGIN
	SELECT tb.`first_name`, tb.`last_name`
	FROM
	(SELECT ah.`first_name`, ah.`last_name`, SUM(a.`balance`) AS 'total_balance'
	FROM `accounts` AS a
	INNER JOIN `account_holders` AS ah
	ON a.`account_holder_id` = ah.`id`
	GROUP BY ah.`first_name`, ah.`last_name`) AS tb
	WHERE tb.`total_balance` > `givenSum`
	ORDER BY tb.`first_name`, tb.`last_name`;
END $$

DELIMITER ;

CALL `usp_get_holders_with_balance_higher_than`(7000);

-- second option
DELIMITER $$
CREATE PROCEDURE `usp_get_holders_with_balance_higher_than`(IN `givenSum` DECIMAL(19, 4))
BEGIN
	SELECT ah.`first_name`, ah.`last_name`
	FROM `accounts` AS a
	INNER JOIN `account_holders` AS ah
	ON a.`account_holder_id` = ah.`id`
	GROUP BY ah.`first_name`, ah.`last_name`
	HAVING SUM(a.`balance`) > `givenSum`
	ORDER BY ah.`first_name`, ah.`last_name`;
END $$

DELIMITER ;

CALL `usp_get_holders_with_balance_higher_than`(7000);