DELIMITER //

CREATE FUNCTION net_salary(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
   RETURN salary * 0.9;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION user_status(last_login DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
   IF DATEDIFF(CURDATE(), last_login) <= 30 THEN
      RETURN 'Active';
   ELSE
      RETURN 'Inactive';
   END IF;
END //

DELIMITER ;


DELIMITER //

CREATE FUNCTION tax_calc(salary INT)
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE tax INT;

   IF salary <= 300000 THEN
      SET tax = 0;
   ELSEIF salary <= 600000 THEN
      SET tax = salary * 0.10;
   ELSEIF salary <= 1000000 THEN
      SET tax = salary * 0.20;
   ELSE
      SET tax = salary * 0.30;
   END IF;

   RETURN tax;
END //

DELIMITER ;