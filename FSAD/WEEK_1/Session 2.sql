CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Student (
    vtu_no VARCHAR(15) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15),
    department VARCHAR(30)
);

CREATE TABLE Course (
    course_code VARCHAR(10),
    course_name VARCHAR(50),
    faculty_id VARCHAR(10),
    student_id VARCHAR(15),
    faculty_email VARCHAR(50)
);

INSERT INTO Student VALUES
('VTU001','Arjun','arjun@gmail.com','9876543210','CSE'),
('VTU002','Priya','priya@gmail.com','9876543211','ISE'),
('VTU003','Rahul','rahul@gmail.com','9876543212','CSE'),
('VTU004','Sneha','sneha@gmail.com','9876543213','ECE'),
('VTU005','Kiran','kiran@gmail.com','9876543214','CSE');

INSERT INTO Course VALUES
('CS101','DBMS','F01','VTU001','f1@gmail.com'),
('CS102','OS','F02','VTU002','f2@gmail.com'),
('CS103','Java','F01','VTU003','f1@gmail.com'),
('CS104','AI','F03','VTU004','f3@gmail.com'),
('CS105','ML','F02','VTU005','f2@gmail.com');

SELECT * FROM Student;
SELECT name, department FROM Student;
SELECT * FROM Student WHERE department='CSE';
SELECT * FROM Student WHERE phone LIKE '9876%';