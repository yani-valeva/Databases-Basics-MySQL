CREATE TABLE `customer_reviews` (
    `review_id` INT,
    `review_content` VARCHAR(255) NOT NULL,
    `review_grade` INT CHECK (`review_grade` BETWEEN 0 AND 10),
    `airline_id` INT,
    `customer_id` INT,
    CONSTRAINT `pk_customer_reviews` PRIMARY KEY (`review_id`),
    CONSTRAINT `fk_customer_reviews_airlines` FOREIGN KEY (`airline_id`)
        REFERENCES `airlines` (`airline_id`),
    CONSTRAINT `fk_customer_reviews_customers` FOREIGN KEY (`customer_id`)
        REFERENCES `customers` (`customer_id`)
);

DELIMITER $$
CREATE PROCEDURE `udp_submit_review`(IN `customer_id` INT, IN `review_content` VARCHAR(255), IN `review_grade` INT, IN `airline_name` VARCHAR(30))
BEGIN
	DECLARE `airlineId` INT;
	DECLARE `reviewId` INT;
	SET `airlineId` := (SELECT a.`airline_id`
								FROM `airlines` AS a
								WHERE a.`airline_name` = `airline_name`);
	SET `reviewId` := (SELECT MAX(cr.`review_id`)
							FROM `customer_reviews` AS cr);
							
	IF `reviewId` IS NULL THEN
		SET `reviewId` := 1;
	ELSE
		SET `reviewId` := `reviewId` + 1;
	END IF;
		
	START TRANSACTION;
	INSERT INTO `customer_reviews`(`review_id`, `review_content`, `review_grade`, `airline_id`, `customer_id`)
	VALUES(`reviewId`, `review_content`, `review_grade`, `airlineId`, `customer_id`);
	
	IF ((SELECT COUNT(*)
				FROM `customers` AS c
				WHERE c.`customer_id` = `customer_id`) != 1) THEN
                ROLLBACK;
   ELSEIF ((SELECT COUNT(*)
				FROM `airlines` AS a
				WHERE a.`airline_name` = `airline_name`) != 1) THEN				
				ROLLBACK;
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Airline does not exist.';
	ELSE
		COMMIT;
	END IF;

END $$

DELIMITER ;