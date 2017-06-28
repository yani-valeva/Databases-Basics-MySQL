DELIMITER $$
CREATE PROCEDURE `usp_get_towns_starting_with`(IN `startWith` VARCHAR(50))
BEGIN
	SELECT t.`name` AS 'town_name'
    FROM `towns` AS t
    WHERE t.`name` LIKE CONCAT(startWith, '%')
    ORDER BY t.`name`;
END $$

DELIMITER ;

CALL `usp_get_towns_starting_with`('b');