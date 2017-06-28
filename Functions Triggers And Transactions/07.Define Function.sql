DELIMITER $$
CREATE FUNCTION `ufn_is_word_comprised`(`set_of_letters` VARCHAR(255), `word` VARCHAR(255))
RETURNS BOOL
BEGIN
	DECLARE `wordLength` INT;
    DECLARE `charIndex` INT;
    SET `wordLength` := CHAR_LENGTH(word);
    SET `charIndex` := 1;
    
    WHILE `charIndex` <= `wordLength` DO
		IF (LOCATE(SUBSTRING(`word`, `charIndex`, 1), `set_of_letters`) < 1) THEN
			RETURN FALSE;
		END IF;
		SET `charIndex` = `charIndex` + 1;
	END WHILE;
    
    RETURN TRUE;
END $$

DELIMITER ;

SELECT `ufn_is_word_comprised`('oistmiahf', 'Sofia') AS 'result';
SELECT `ufn_is_word_comprised`('oistmiahf', 'halves') AS 'result';
SELECT `ufn_is_word_comprised`('bobr', 'Rob') AS 'result';
SELECT `ufn_is_word_comprised`('pppp', 'Guy') AS 'result';