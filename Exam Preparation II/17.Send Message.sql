DELIMITER $$
CREATE PROCEDURE `udp_send_message`(IN `user_id` INT, IN `chat_id` INT, IN `content` VARCHAR(200))
BEGIN
	START TRANSACTION;
	INSERT INTO `messages`(`content`, `sent_on`, `chat_id`, `user_id`)
	VALUES(`content`, '2016-12-15', `chat_id`, `user_id`);
	
	IF ((SELECT COUNT(*)
				FROM `users_chats` AS uc
				WHERE uc.`user_id` = `user_id`
                AND uc.`chat_id` = `chat_id`) < 1) THEN
		ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'There is no chat with that user!';
	ELSE
		COMMIT;
	END IF;	
END $$

DELIMITER ;

CALL `udp_send_message`(19, 17, 'Awesome');