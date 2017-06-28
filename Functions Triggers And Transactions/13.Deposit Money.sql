DELIMITER $$
CREATE PROCEDURE `usp_deposit_money` (IN `account_id` INT, IN `money_amount` DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    UPDATE `accounts`
    SET `balance` = `balance` + `money_amount`
    WHERE `id` = `account_id`;
    
    IF ((SELECT COUNT(*)
				FROM `accounts`
				WHERE `id` = `account_id`) != 1) THEN
                ROLLBACK;
	ELSEIF (`money_amount` <= 0) THEN
		 ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END $$

DELIMITER ;

CALL `usp_deposit_money`(1, 10);