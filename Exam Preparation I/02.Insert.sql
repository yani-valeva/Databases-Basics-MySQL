INSERT INTO `flights` (`departure_time`, `arrival_time`, `status`, `origin_airport_id`, `destination_airport_id`, `airline_id`)
VALUES
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 1 % 4 = 0 THEN 'Departing'
			WHEN 1 % 4 = 1 THEN 'Delayed'
			WHEN 1 % 4 = 2 THEN 'Arrived'
			WHEN 1 % 4 = 3 THEN 'Canceled'
		END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 1)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 1)))),
             1),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 2 % 4 = 0 THEN 'Departing'
			WHEN 2 % 4 = 1 THEN 'Delayed'
			WHEN 2 % 4 = 2 THEN  'Arrived'
			WHEN 2 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 2)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 2)))),
             2),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 3 % 4 = 0 THEN 'Departing'
			WHEN 3 % 4 = 1 THEN 'Delayed'
			WHEN 3 % 4 = 2 THEN  'Arrived'
			WHEN 3 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name`
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 3)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 3)))),
             3),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 4 % 4 = 0 THEN 'Departing'
			WHEN 4 % 4 = 1 THEN 'Delayed'
			WHEN 4 % 4 = 2 THEN  'Arrived'
			WHEN 4 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 4)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 4)))),
             4),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 5 % 4 = 0 THEN 'Departing'
			WHEN 5 % 4 = 1 THEN 'Delayed'
			WHEN 5 % 4 = 2 THEN  'Arrived'
			WHEN 5 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 5)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 5)))),
             5),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 6 % 4 = 0 THEN 'Departing'
			WHEN 6 % 4 = 1 THEN 'Delayed'
			WHEN 6 % 4 = 2 THEN  'Arrived'
			WHEN 6 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name`
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 6)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 6)))),
             6),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 7 % 4 = 0 THEN 'Departing'
			WHEN 7 % 4 = 1 THEN 'Delayed'
			WHEN 7 % 4 = 2 THEN  'Arrived'
			WHEN 7 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 7)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 7)))),
             7),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 8 % 4 = 0 THEN 'Departing'
			WHEN 8 % 4 = 1 THEN 'Delayed'
			WHEN 8 % 4 = 2 THEN  'Arrived'
			WHEN 8 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 8)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 8)))),
             8),
('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 9 % 4 = 0 THEN 'Departing'
			WHEN 9 % 4 = 1 THEN 'Delayed'
			WHEN 9 % 4 = 2 THEN  'Arrived'
			WHEN 9 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 9)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 9)))),
             9),
             ('2017-06-19 14:00:00', '2017-06-21 11:00:00', 
		CASE
			WHEN 10 % 4 = 0 THEN 'Departing'
			WHEN 10 % 4 = 1 THEN 'Delayed'
			WHEN 10 % 4 = 2 THEN  'Arrived'
			WHEN 10 % 4 = 3 THEN 'Canceled'
			END,
            CEILING(SQRT(CHAR_LENGTH((SELECT a.`airline_name` 
									FROM `airlines` AS a 
									WHERE a.`airline_id` = 10)))),
			CEILING(SQRT(CHAR_LENGTH((SELECT a.`nationality`
										FROM `airlines` AS a
                                        WHERE a.`airline_id` = 10)))),
             10);
