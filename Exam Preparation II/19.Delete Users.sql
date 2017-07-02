DELIMITER $$
CREATE TRIGGER `tr_delete_users`
BEFORE DELETE
ON `users`
FOR EACH ROW
BEGIN
	DELETE FROM `messages`
    WHERE messages.`user_id` = old.`id`;
    DELETE FROM `users_chats` 
    WHERE users_chats.`user_id` = old.`id`;
    DELETE FROM `messages_log` 
    WHERE messages_log.`user_id` = old.`id`;
    SET FOREIGN_KEY_CHECKS = 0;
    DELETE FROM `credentials` 
    WHERE credentials.`id` = old.`credential_id`;
    SET FOREIGN_KEY_CHECKS = 1;
END $$

DELIMITER ;

DELETE FROM `users` 
WHERE id = 1;

SET FOREIGN_KEY_CHECKS = 0;
	DELETE FROM `users` 
    WHERE id = old.id;
