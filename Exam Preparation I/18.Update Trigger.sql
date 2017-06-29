CREATE TABLE arrived_flights (
    flight_id INT,
    arrival_time DATETIME NOT NULL,
    origin VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    passengers INT NOT NULL,
    CONSTRAINT pk_arrived_flights PRIMARY KEY (flight_id)
);


DROP TRIGGER IF EXISTS `tr_update_flights`;
DELIMITER $$
CREATE TRIGGER `tr_update_flights`
BEFORE UPDATE 
ON `flights`
FOR EACH ROW
BEGIN
	IF (old.`status` IN('Departing', 'Delayed') AND new.`status` = 'Arrived') THEN
		INSERT INTO `arrived_flights`(`flight_id`, `arrival_time`, `origin`, `destination`, `passengers`)
        VALUES(old.`flight_id`, old.`arrival_time`, (SELECT a.`airport_name` FROM `airports` a WHERE a.`airport_id` = old.`origin_airport_id`),
                                                (SELECT a.`airport_name` FROM `airports` a WHERE a.`airport_id` = old.`destination_airport_id`),
											    (SELECT COUNT(*) FROM `tickets` AS t WHERE t.`flight_id` = old.`flight_id`));
	END IF;
END $$

DELIMITER ;