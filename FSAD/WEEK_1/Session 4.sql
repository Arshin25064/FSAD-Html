SELECT course_name, COUNT(student_id) AS total_students
FROM Course
GROUP BY course_name;

CREATE TABLE FacultyCourses AS
SELECT faculty_id, course_name
FROM Course;

UPDATE Student
SET phone = CONCAT('+91', phone)
WHERE department='CSE'
LIMIT 5;