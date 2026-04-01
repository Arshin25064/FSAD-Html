CREATE TABLE Driver (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    otp INT
);


DELIMITER //

CREATE TRIGGER before_driver_insert
BEFORE INSERT ON Driver
FOR EACH ROW
BEGIN
    IF NEW.otp IS NULL OR NEW.otp <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid OTP';
    END IF;
END //

DELIMITER ;


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    total_amount DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE OrderItems (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    dish_name VARCHAR(50),
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

DELIMITER //

CREATE TRIGGER after_orderitem_insert
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Orders
    SET total_amount = total_amount + NEW.price
    WHERE order_id = NEW.order_id;
END //

DELIMITER ;

CREATE TABLE Students1(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //

CREATE TRIGGER before_student_insert
BEFORE INSERT ON Students1
FOR EACH ROW
BEGIN
    SET NEW.created_at = CURRENT_TIMESTAMP;
END //

DELIMITER ;

CREATE TABLE Employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);


DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

DELIMITER ;

CREATE TABLE Employee_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_name VARCHAR(50),
    old_salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    INSERT INTO Employee_Audit(emp_id, old_name, old_salary)
    VALUES (OLD.id, OLD.name, OLD.salary);
END //

DELIMITER ;