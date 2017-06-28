DELIMITER $$
CREATE PROCEDURE `usp_withdraw_money` (`account_id` INT, `money_amount` DECIMAL(19,4))
BEGIN
START TRANSACTION;
	UPDATE `accounts`
    SET `balance` = `balance` - `money_amount`
    WHERE `id` = `account_id`;
    
    IF ((SELECT COUNT(*)
				FROM `accounts`
				WHERE `id` = `account_id`) != 1) THEN
                ROLLBACK;
	ELSEIF (`money_amount` <= 0) THEN
		 ROLLBACK;
	ELSEIF ((SELECT a.`balance` FROM `accounts` AS a WHERE a.`id` = `account_id`) < `money_amount`) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;

END $$

DELIMITER ;

CALL `usp_withdraw_money`(1, 10);