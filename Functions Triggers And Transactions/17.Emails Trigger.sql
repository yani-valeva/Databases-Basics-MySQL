CREATE TABLE `notification_emails`
(
`id` INT AUTO_INCREMENT PRIMARY KEY, 
`recipient` INT, 
`subject` VARCHAR(255), 
`body` VARCHAR(255)
);

drop trigger if exists `tr_update_logs`;
DELIMITER $$
CREATE TRIGGER `tr_update_logs`
AFTER INSERT
ON `logs`
FOR EACH ROW
BEGIN
	INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
    VALUES (new.`log_id`, CONCAT('Balance change for account: ', new.`log_id`), 
    CONCAT('On ', DATE_FORMAT(now(), '%b %d %Y at %r'), ' your balance was changed from ', new.`old_sum`, ' to ', new.`new_sum`,'.'));
END $$

DELIMITER ;

UPDATE `accounts`
SET `balance` = `balance` + 10;

SELECT *
FROM `notification_emails`;