DELIMITER $$
CREATE PROCEDURE `usp_take_loan`(IN `customer_id` INT, IN `loan_amount` DECIMAL(18, 2), IN `interest` DECIMAL(4, 2), IN `start_date` DATE)
BEGIN
	START TRANSACTION;
    INSERT INTO `loans` (`start_date`, `amount`, `interest`, `customer_id`)
    VALUES(`start_date`, `loan_amount`, `interest`, `customer_id`);
    
    IF (`loan_amount` NOT BETWEEN 0.01 AND 100000) THEN
		ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Loan Amount.';
	ELSE
		COMMIT;
	END IF;
END $$

DELIMITER ;

CALL usp_take_loan (1, 500, 1,'20160915');