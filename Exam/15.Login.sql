CREATE TABLE `logged_in_users` (
    `id` INT,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL,
    `email` VARCHAR(50),
    CONSTRAINT `pk_logged_in_users` PRIMARY KEY (`id`)
);

CREATE TABLE `evaluated_submissions` (
    `id` INT AUTO_INCREMENT,
    `problem` VARCHAR(100) NOT NULL,
    `user` VARCHAR(30) NOT NULL,
    `result` INT NOT NULL,
    CONSTRAINT `pk_evaluated_submissions` PRIMARY KEY (`id`)
);

DELIMITER $$
CREATE PROCEDURE `udp_login` (IN `username` VARCHAR(30), IN `password` VARCHAR(30))
BEGIN
	DECLARE `userId` INT;
    DECLARE `userEmail` VARCHAR(50);
    SET `userId` := (SELECT u.`id` FROM `users` AS u WHERE u.`username` = `username` AND u.`password` = `password`);
    SET `userEmail` := (SELECT u.`email` FROM `users` AS u WHERE u.`username` = `username` AND u.`password` = `password`);
    
	START TRANSACTION;

    
    IF ((SELECT COUNT(*)
			FROM `users` AS u
			WHERE u.`username` = `username`) != 1) THEN
                ROLLBACK;
				SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Username does not exist!';      
	END IF;
	IF ((SELECT COUNT(*)
				FROM `users` AS u
				WHERE u.`username` = `username` AND u.`password` = `password`) != 1) THEN
                ROLLBACK;
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password is incorrect!';
	END IF;
	IF ((SELECT COUNT(`id`)
				FROM `logged_in_users` AS liu
				WHERE liu.`username` = `username` AND liu.`password` = `password`) > 0) THEN
                ROLLBACK;
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User is already logged in!';
	END IF;
	
    INSERT INTO `logged_in_users` (`id`, `username`, `password`, `email`)
    VALUES (`userId`, `username`, `password`, `userEmail`);
    
    COMMIT;
END $$

CALL `udp_login`('doge', 'doge');