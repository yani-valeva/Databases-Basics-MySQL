CREATE TABLE `messages_log` (
    `id` INT,
    `content` VARCHAR(200),
    `sent_on` DATE,
    `chat_id` INT,
    `user_id` INT,
    CONSTRAINT `pk_messages` PRIMARY KEY (`id`)
);

DELIMITER $$
CREATE TRIGGER `tr_delete_messages`
AFTER DELETE
ON `messages`
FOR EACH ROW
BEGIN
	INSERT INTO `messages_log`(`id`, `content`, `sent_on`, `chat_id`, `user_id`)
	VALUES (old.`id`, old.`content`, old.`sent_on`, old.`chat_id`, old.`user_id`);
END $$

DELIMITER ;

DELETE FROM `messages`
WHERE id = 1;

SELECT *
FROM `messages_log`;