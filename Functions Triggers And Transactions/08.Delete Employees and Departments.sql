-- first option
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM `employees`
WHERE `department_id` IN(7, 8);

DELETE FROM `departments`
WHERE `name` IN('Production', 'Production Control');

-- second option
ALTER TABLE `employees_projects`
DROP FOREIGN KEY `fk_employees_projects_employees`;

ALTER TABLE `employees_projects`
ADD CONSTRAINT `fk_employees_projects_employees` FOREIGN KEY(`employee_id`)
REFERENCES `employees`(`employee_id`)
ON DELETE CASCADE;

ALTER TABLE `departments`
DROP FOREIGN KEY `fk_departments_employees`;

ALTER TABLE `departments`
ADD CONSTRAINT `fk_departments_employees` FOREIGN KEY(`manager_id`)
REFERENCES `employees`(`employee_id`)
ON DELETE CASCADE;

ALTER TABLE `employees`
DROP FOREIGN KEY `fk_employees_employees`;

ALTER TABLE `employees`
ADD CONSTRAINT `fk_employees_employees` FOREIGN KEY(`manager_id`)
REFERENCES `employees`(`employee_id`)
ON DELETE CASCADE;

ALTER TABLE `employees`
DROP FOREIGN KEY `fk_employees_departments`;

ALTER TABLE `employees`
ADD CONSTRAINT `fk_employees_departments` FOREIGN KEY(`department_id`)
REFERENCES `departments`(`department_id`)
ON DELETE CASCADE;

DELETE FROM `employees`
WHERE `department_id` IN(7, 8);

DELETE FROM `departments`
WHERE `name` IN('Production', 'Production Control');