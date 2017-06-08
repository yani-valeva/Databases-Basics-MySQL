CREATE TABLE `teachers` (
    `teacher_id` INT NOT NULL,
    `name` VARCHAR(50),
    `manager_id` INT,
    CONSTRAINT `pk_teacher_id` PRIMARY KEY (`teacher_id`),
    CONSTRAINT `fk_teachers_teachers` FOREIGN KEY (`manager_id`)
        REFERENCES `teachers` (`teacher_id`)
);

INSERT INTO `teachers` (`teacher_id`, `name`, `manager_id`)
VALUES (101, 'John', NULL), (105, 'Mark', 101), (106, 'Greta', 101), 
(102, 'Maya', 106), (103, 'Silvia', 106), (104, 'Ted', 105);