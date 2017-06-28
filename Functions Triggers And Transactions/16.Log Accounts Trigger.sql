CREATE TABLE `logs` (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    old_sum DECIMAL(19 , 4 ),
    new_sum DECIMAL(19 , 4 )
);

DELIMITER $$
CREATE TRIGGER `tr_update_accounts`
AFTER UPDATE 
ON `accounts`
FOR EACH ROW
BEGIN
	INSERT INTO `logs`(`account_id`, `old_sum`, `new_sum`)
    VALUES (old.`id`, old.`balance`, new.`balance`);
END $$

DELIMITER ;

UPDATE `accounts`
SET `balance` = `balance` + 10
WHERE id = 1;

SELECT *
FROM `logs`;
