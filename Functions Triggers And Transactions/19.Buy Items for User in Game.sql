DELIMITER $$
CREATE PROCEDURE `usp_items_validations`(IN `item_name` VARCHAR(50), IN `user_game_id` INT)
BEGIN
	DECLARE `itemId` INT;    
    DECLARE `item_min_level` INT;
    DECLARE `alexMoney` INT;
    DECLARE `itemPrice` DECIMAL(19, 4);
    DECLARE `gameLevel` INT;
	SET `itemId` := (SELECT i.`id`
						FROM `items` AS i
						WHERE i.`name` = `item_name`);
	SET `item_min_level` := (SELECT i.`min_level`
								FROM `items` AS i
								WHERE i.`name` = `item_name`);
	SET `alexMoney` := (SELECT ug.`cash`
							FROM `users_games` AS ug
							WHERE ug.`id` = `user_game_id`);
	SET `itemPrice` := (SELECT i.`price`
								FROM `items` AS i
								WHERE i.`id` = `itemId`);
	SET `gameLevel` := (SELECT ug.`level`
							FROM `users_games` AS ug
							WHERE ug.`id` = `user_game_id`);
    START TRANSACTION;
	INSERT INTO `user_game_items`
    VALUES (`itemId`, `user_game_id`);
    
    UPDATE `users_games`
    SET `cash` = `cash` - `itemPrice`
	WHERE `id` = `user_game_id`;
	
    IF (`alexMoney` < `itemPrice`) THEN
		ROLLBACK;
	ELSEIF (`item_min_level` > `gameLevel`) THEN
		ROLLBACK;
	ELSE
		COMMIT;
	END IF;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS `usp_buy_items_for_alex`;
DELIMITER $$
CREATE PROCEDURE `usp_buy_items_for_alex`()
BEGIN
	DECLARE `alexId` INT;
    DECLARE `gameId` INT;    
    DECLARE `userGameId` INT;
    SET `alexId` := (SELECT u.`id`
						FROM `users` AS u
						WHERE u.`user_name` = 'Alex');
	SET `gameId` := (SELECT g.`id`
						FROM `games` AS g
						WHERE g.`name` = 'Edinburgh');
	SET `userGameId` := (SELECT ug.`id`
							FROM `users_games` AS ug
							WHERE ug.`game_id` = `gameId` AND ug.`user_id` = `alexId`);
	
    CALL `usp_items_validations`('Blackguard', `userGameId`);
    CALL `usp_items_validations`('Bottomless Potion of Amplification', `userGameId`);
    CALL `usp_items_validations`('Eye of Etlich (Diablo III)', `userGameId`);
    CALL `usp_items_validations`('Gem of Efficacious Toxin', `userGameId`);
    CALL `usp_items_validations`('Golden Gorget of Leoric', `userGameId`);
    CALL `usp_items_validations`('Ziggurat Tooth', `userGameId`);
    CALL `usp_items_validations`('The Three Hundredth Spear', `userGameId`);
    CALL `usp_items_validations`('The Short Mans Finger', `userGameId`);
    CALL `usp_items_validations`('Tzo Krins Gaze', `userGameId`);
    CALL `usp_items_validations`('Valtheks Rebuke', `userGameId`);
    CALL `usp_items_validations`('Utars Roar', `userGameId`);
    CALL `usp_items_validations`('Urn of Quickening', `userGameId`);
    CALL `usp_items_validations`('Boots', `userGameId`);
    CALL `usp_items_validations`('Bombardiers Rucksack', `userGameId`);
    CALL `usp_items_validations`('Cloak of Deception', `userGameId`);
    CALL `usp_items_validations`('Hellfire Amulet', `userGameId`);
    
    SELECT u.`user_name`, g.`name`, ug.`cash`, i.`name` AS 'Item Name'
	FROM `users` AS u
	INNER JOIN `users_games` AS ug
	ON u.`id` = ug.`user_id`
	INNER JOIN `games` AS g
	ON ug.`game_id` = g.`id`
	INNER JOIN `user_game_items` AS ugi
	ON ug.`id` = ugi.`user_game_id`
	INNER JOIN `items` AS i
	ON ugi.`item_id` = i.`id`
	WHERE g.`name` = 'Edinburgh'
	ORDER BY i.`name`;
END $$

DELIMITER ;

CALL `usp_buy_items_for_alex`;