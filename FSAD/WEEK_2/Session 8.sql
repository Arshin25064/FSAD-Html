CREATE INDEX idx_email
ON Student(email);

CREATE UNIQUE INDEX idx_username
ON Student(name);

DROP INDEX idx_email ON Student;

CREATE INDEX idx_aadhar
ON Student(phone);  


USE CollegeDB;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_status_created
ON Orders(status, created_at);
