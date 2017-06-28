DELIMITER $$
CREATE FUNCTION `ufn_get_salary_level`(`salary` DECIMAL(19, 4)) 
RETURNS VARCHAR(10)
BEGIN
	DECLARE `salary_level` VARCHAR(10);
    
    IF (`salary` < 30000) THEN
		SET `salary_level` := 'Low';
	ELSEIF (`salary` <= 50000) THEN
		SET `salary_level` := 'Average';
	ELSE
		SET `salary_level` := 'High';
	END IF;
    
    RETURN `salary_level`;
END $$

DELIMITER ;

DROP PROCEDURE IF EXISTS `usp_get_employees_by_salary_level`;
DELIMITER $$
CREATE PROCEDURE `usp_get_employees_by_salary_level`(IN `salaryLevel` VARCHAR(10))
BEGIN
	SELECT sal.`first_name`, sal.`last_name`
    FROM 
	(SELECT e.`first_name`, e.`last_name`, `ufn_get_salary_level`(e.`salary`)
			FROM `employees` AS e
            WHERE `ufn_get_salary_level`(e.`salary`) = `salaryLevel`) AS sal
	ORDER BY sal.`first_name` DESC, sal.`last_name` DESC;
END $$

DELIMITER ;

CALL `usp_get_employees_by_salary_level`('High');