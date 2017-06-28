DELIMITER $$
CREATE PROCEDURE `usp_massive_shopping`()
BEGIN
	DECLARE `userName` VARCHAR(50);
    DECLARE `userId` INT;
    DECLARE `gameName` VARCHAR(50);
    DECLARE `gameId` INT;
    DECLARE `neededMoneyFirstGrItems` DECIMAL(19, 4);
    DECLARE `neededMoneySecondGrItems` DECIMAL(19, 4);
    DECLARE `stamatCash` DECIMAL(19, 4);
    DECLARE `userGameItemId` INT;
    SET `userName` := 'Stamat';
    SET `userId` := (SELECT u.`id`
						FROM `users` AS u
						WHERE u.`user_name` = `userName`);
    SET `gameName` := 'Safflower';
    SET `gameId` := (SELECT g.`id`
						FROM `games` AS g
						WHERE g.`name` = `gameName`);
    SET `neededMoneyFirstGrItems` := (SELECT SUM(p.`price`) AS 'first_g_price'
										FROM
										(SELECT i.`id`, i.`price`
										FROM `items` AS i
										WHERE i.`min_level` IN(11,12)) AS p);
	SET `neededMoneySecondGrItems` := (SELECT SUM(p.`price`) AS 'second_g_price'
										FROM
										(SELECT i.`id`, i.`price`
										FROM `items` AS i
										WHERE i.`min_level` BETWEEN 19 AND 21) AS p);
	SET `stamatCash` := (SELECT ug.`cash`
							FROM `users_games` AS ug
							WHERE ug.`user_id` = `userId` AND ug.`game_id` = `gameId`);
	SET `userGameItemId` := (SELECT ug.`id`
								FROM `users_games` AS ug
								WHERE ug.`user_id` = `userId` AND ug.`game_id` = `gameId`);
	START TRANSACTION;
    UPDATE `users_games`
    SET `cash` = `stamatCash` - `neededMoneyFirstGrItems`
    WHERE `user_id` = `userId` AND `game_id` = `gameId`;
    
   INSERT INTO `user_game_items` (`item_id`, `user_game_id`)
   (SELECT i.`id`, `userGameItemId`
			FROM `items` AS i
			WHERE i.`min_level` IN(11,12));
            
	IF(`stamatCash` < `neededMoneyFirstGrItems`) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
    
    SET `stamatCash` := (SELECT ug.`cash`
							FROM `users_games` AS ug
							WHERE ug.`user_id` = `userId` AND ug.`game_id` = `gameId`);
	START TRANSACTION;
    UPDATE `users_games`
    SET `cash` = `stamatCash` - `neededMoneySecondGrItems`
    WHERE `user_id` = `userId` AND `game_id` = `gameId`;
    
   INSERT INTO `user_game_items` (`item_id`, `user_game_id`)
   (SELECT i.`id`, `userGameItemId`
			FROM `items` AS i
			WHERE i.`min_level` BETWEEN 19 AND 21);
            
	IF(`stamatCash` < `neededMoneySecondGrItems`) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
    
	SELECT i.name AS 'Item Name'
	FROM `games` AS g
	INNER JOIN `users_games` AS ug
	ON g.`id` = ug.`game_id`
	INNER JOIN `user_game_items` AS ugi
	ON ug.`id` = ugi.`user_game_id`
	INNER JOIN `items` AS i
	ON ugi.`item_id` = i.`id`
	WHERE g.`name` = 'Safflower'
	ORDER BY g.`name`;

	SELECT ug.`cash`
	FROM `users_games` AS ug
	WHERE ug.`game_id` IN(SELECT g.`id`
						FROM `games` AS g
						WHERE g.`name` = 'Safflower')
	AND ug.user_id IN(SELECT u.`id`
						FROM `users` AS u
						WHERE u.`user_name` = 'Stamat');

END $$

DELIMITER ;

CALL `usp_massive_shopping`;