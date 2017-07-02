DELIMITER $$
CREATE PROCEDURE `udp_change_password`(IN `email` VARCHAR(30), IN `new_password` VARCHAR(20))
BEGIN
	START TRANSACTION;
	UPDATE `credentials` AS c
	SET c.`password` = `new_password`
	WHERE c.`email` = `email`;
	
	IF ((SELECT COUNT(*)
				FROM `credentials` AS c
				WHERE c.`email` = `email`) != 1) THEN
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The email does\'t exist!';
	ELSE
		 COMMIT;
	END IF;
   
END $$

DELIMITER ;

CALL `udp_change_password`(abarnes0@sogou.com, new_pass);