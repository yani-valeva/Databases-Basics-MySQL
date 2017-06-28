DELIMITER $$
CREATE FUNCTION `ufn_calculate_future_value`(`initialSum` DECIMAL(19, 4), `interestRate` DECIMAL(19, 4), `year` INT)
RETURNS DECIMAL(19, 4)
BEGIN
	DECLARE `futureValue` DECIMAL(19, 4);
    SET `futureValue` := `initialSum` * POW(1 + `interestRate`, `year`);

	RETURN `futureValue`;
END $$

DELIMITER ;

SELECT `ufn_calculate_future_value`(1000, 0.1, 5);