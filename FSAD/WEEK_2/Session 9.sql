SELECT CONCAT(SUBSTRING_INDEX(email,'@',1),'123') AS default_password
FROM Student;

SELECT REGEXP_REPLACE(phone, '[^0-9]', '') AS clean_phone
FROM Student;

SELECT CONCAT(
    UPPER(SUBSTRING(name,1,1)),
    LOWER(SUBSTRING(name,2))
) AS formatted_name
FROM Student;

SELECT name,
COALESCE(phone, email) AS contact
FROM Student;


USE CollegeDB;
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    join_date DATE
);
INSERT INTO Employee VALUES
(1,'Arjun','CSE',50000,'2018-06-10'),
(2,'Priya','ISE',60000,'2020-03-15'),
(3,'Rahul','CSE',55000,'2017-08-20'),
(4,'Sneha','ECE',45000,'2021-01-05'),
(5,'Kiran','CSE',70000,'2016-11-25');
SELECT department,
AVG(TIMESTAMPDIFF(YEAR, join_date, CURDATE())) AS avg_exp
FROM Employee
GROUP BY department;
