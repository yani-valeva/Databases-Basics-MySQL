DELIMITER $$
CREATE PROCEDURE `udp_evaluate` (IN `id` INT) 
BEGIN
	DECLARE `result` INT;
    DECLARE `userId` INT;
    DECLARE `problemId` INT;
    DECLARE `problemName` VARCHAR(100);
    DECLARE `userName` VARCHAR(30);
    SET `result` := (SELECT CEIL((p.`points` / p.`tests`) * s.`passed_tests`)
						FROM `submissions` AS s
						INNER JOIN `problems` AS p
						ON s.`problem_id` = p.`id`
                        WHERE s.`id` = `id`);
	SET `userId` := (SELECT s.`user_id` FROM `submissions` AS s WHERE s.`id` = id);
    SET `problemId` := (SELECT s.`problem_id` FROM `submissions` AS s WHERE s.`id` = id);
    SET `problemName` := (SELECT p.`name` FROM `problems` AS p WHERE p.`id` = `problemId`);
    SET `userName` := (SELECT u.`username` FROM `users` AS u WHERE u.`id` =  `userId`);
	START TRANSACTION;
	IF((SELECT COUNT(*)
				FROM `submissions` AS s
				WHERE s.`id` = `id`) != 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Submission does not exist!';
        ROLLBACK;
	END IF;
    
    INSERT INTO `evaluated_submissions` (`id`, `problem`, `user`, `result`)
    VALUES(`id`, `problemName`, `userName`, `result`);

END $$

CALL `udp_evaluate`(1);