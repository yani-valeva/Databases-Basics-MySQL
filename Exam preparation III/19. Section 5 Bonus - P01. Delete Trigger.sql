CREATE TABLE `account_logs` (
    account_id INT,
    account_number CHAR(12) NOT NULL,
    start_date DATE NOT NULL,
    customer_id INT NOT NULL,
    CONSTRAINT pk_account_logs PRIMARY KEY (account_id),
    CONSTRAINT fk_account_logs_customers FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

DROP TRIGGER IF EXISTS `tr_delete_account_records`;
DELIMITER $$
CREATE TRIGGER `tr_delete_account_records`
BEFORE DELETE 
ON `accounts`
FOR EACH ROW
BEGIN
	DELETE FROM `employees_accounts`
    WHERE employees_accounts.`account_id` = OLD.`account_id`;
	INSERT INTO `account_logs`(`account_id`, `account_number`, `start_date`, `customer_id`)
    VALUES (OLD.`account_id`, OLD.`account_number`, OLD.`start_date`, OLD.`customer_id`);
END $$

DELIMITER ;


SELECT *
FROM `accounts`
WHERE `customer_id` = 6;

DELETE FROM `accounts`
WHERE `customer_id` = 6;


SELECT *
FROM `account_logs`;
