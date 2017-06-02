CREATE TABLE `people` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `birthdate` DATETIME,
    CONSTRAINT `pk_people` PRIMARY KEY (id)
);

INSERT INTO `people` (`name`, `birthdate`)
VALUES ('Victor', '2000-12-07 00:00:00'), ('Steven', '1992-09-10 00:00:00'), ('Stephen', '1910-09-19 00:00:00'), ('John', '2010-01-06 00:00:00');

SELECT `name`,
    TIMESTAMPDIFF(YEAR, `birthdate`, NOW()) AS 'age_in_years',
    TIMESTAMPDIFF(MONTH, `birthdate`, NOW()) AS 'age_in_months',
    TIMESTAMPDIFF(DAY, `birthdate`, NOW()) AS 'age_in_days',
    TIMESTAMPDIFF(MINUTE, `birthdate`, NOW()) AS 'age_in_minutes'
FROM `people`;
