DELIMITER $$
CREATE PROCEDURE `usp_transfer_money`(IN `from_account_id` INT, IN `to_account_id` INT, IN `amount` DECIMAL(19, 4))
BEGIN
	START TRANSACTION;
    UPDATE `accounts`
    SET `balance` = `balance` - `amount`
    WHERE `id` = `from_account_id`;
    
    UPDATE `accounts`
    SET `balance` = `balance` + `amount`
    WHERE `id` = `to_account_id`;
    
    IF ((SELECT COUNT(*)
				FROM `accounts`
				WHERE `id` = `from_account_id`) != 1) THEN
		ROLLBACK;
	ELSEIF ((SELECT COUNT(*)
				FROM `accounts`
				WHERE `id` = `to_account_id`) != 1) THEN
		ROLLBACK;
	ELSEIF (`amount` <= 0) THEN
		ROLLBACK;
	ELSEIF ((SELECT a.`balance` FROM `accounts` AS a WHERE a.`id` = `from_account_id`) < `amount`) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END $$

DELIMITER ;

CALL `usp_transfer_money`(1, 2, 10);