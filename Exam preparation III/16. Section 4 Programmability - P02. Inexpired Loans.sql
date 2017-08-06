DELIMITER $$
CREATE PROCEDURE `usp_customers_with_unexpired_loans`(IN `customerId` INT)
BEGIN
	SELECT c.`customer_id`, c.`first_name`, l.`loan_id`
    FROM `customers` AS c
    INNER JOIN `loans` AS l
    ON c.`customer_id` = l.`customer_id`
    WHERE l.`expiration_date` IS NULL AND c.`customer_id` = `customerId`;
END $$

DELIMITER ;

CALL `usp_customers_with_unexpired_loans`(9);
