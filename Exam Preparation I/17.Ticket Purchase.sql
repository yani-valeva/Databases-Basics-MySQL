CREATE TABLE `customer_bank_accounts` (
    `account_id` INT,
    `account_number` VARCHAR(10) NOT NULL UNIQUE,
    `balance` DECIMAL(10 , 2 ) NOT NULL,
    `customer_id` INT,
    CONSTRAINT `pk_customer_bank_accounts` PRIMARY KEY (`account_id`),
    CONSTRAINT `fk_customer_bank_accounts_customers` FOREIGN KEY (`customer_id`)
        REFERENCES `customers` (`customer_id`)
);

DELIMITER $$
CREATE PROCEDURE `udp_purchase_ticket`(IN `customer_id` INT, IN `flight_id` INT, IN `ticket_price` DECIMAL(8, 2), IN `class` VARCHAR(6), IN `seat` VARCHAR(5))
BEGIN
	DECLARE `customerBalance` DECIMAL(10, 2);
    SET `customerBalance` := (SELECT cba.`balance`
								FROM `customer_bank_accounts` AS cba
								WHERE cba.`customer_id` = `customer_id`);
                                
	START TRANSACTION;
    UPDATE `customer_bank_accounts` AS cba
    SET cba.`balance` = `customerBalance` - `ticket_price`
    WHERE cba.`customer_id` = `customer_id`;
    
    INSERT INTO `tickets`(`price`, `class`, `seat`, `customer_id`, `flight_id`)
    VALUES(`ticket_price`, `class`, `seat`, `customer_id`, `flight_id`);
    
    IF (`customerBalance` IS NULL OR `customerBalance` < `ticket_price`) THEN		
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient bank account balance for ticket purchase.';
	END IF;
    COMMIT;
END $$

DELIMITER ;