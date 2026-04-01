SELECT * FROM Student;
SELECT * FROM Course;

#Aggregate functions
SELECT COUNT(*) FROM Student;
SELECT COUNT(*) FROM Student WHERE department='CSE';
SELECT MAX(phone) FROM Student;

#sort data
SELECT * FROM Student ORDER BY vtu_no ASC;
SELECT * FROM Student ORDER BY vtu_no DESC;

SELECT * FROM Student WHERE department='CSE';

#join
SELECT s.vtu_no, s.name, c.course_name, c.faculty_id
FROM Student s
JOIN Course c ON s.vtu_no = c.student_id;