DROP FUNCTION IF EXISTS `udf_concat_string`; 
DELIMITER $$
CREATE FUNCTION `udf_concat_string`(`first_string` VARCHAR(255), `second_string` VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
	RETURN CONCAT(REVERSE(`first_string`), REVERSE(`second_string`));
END $$

DELIMITER ;