-- first option
DELIMITER $$
CREATE PROCEDURE `usp_calculate_future_value_for_account`(IN `account_id` INT, IN `interest_rate` DECIMAL(19,4))
BEGIN
	DECLARE `years` INT;
    DECLARE `futureValue` DECIMAL(19, 4);
    DECLARE `currentBalance` DECIMAL(19, 4);
    SET `years` := 5;
    SET `currentBalance` := (SELECT a.`balance`
								FROM `accounts` AS a
								WHERE a.`id` = `account_id`);
	SET `futureValue` := `currentBalance` * POW(1 + `interest_rate`, `years`);
	SELECT a.`id` AS 'account_id', ah.`first_name`, ah.`last_name`, a.`balance` AS 'current_balance', `futureValue` AS 'balance_in_5_years'
	FROM `account_holders` AS ah
	INNER JOIN `accounts` AS a
	ON ah.`id` = a.`account_holder_id`
    WHERE a.`id` = `account_id`;
END $$

DELIMITER ;
-- second option
DELIMITER $$
CREATE PROCEDURE `usp_calculate_future_value_for_account`(IN `account_id` INT, IN `interest_rate` DECIMAL(19,4))
BEGIN
	DECLARE `years` INT;
    SET `yeаrs` := 5;
	SELECT a.`id` AS 'account_id', ah.`first_name`, ah.`last_name`, a.`balance` AS 'current_balance', `ufn_calculate_future_value`(a.`balance`, `interest_rate`, `years`) AS 'balance_in_5_years'
	FROM `account_holders` AS ah
	INNER JOIN `accounts` AS a
	ON ah.`id` = a.`account_holder_id`
    WHERE a.`id` = `account_id`;
END $$


DELIMITER ;

CALL `usp_calculate_future_value_for_account`(1, 0.1);