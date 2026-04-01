USE CollegeDB;
CREATE TABLE Events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(50),
    start_date DATE,
    end_date DATE,
    created_at DATE
);
INSERT INTO Events (event_name, start_date, end_date, created_at) VALUES
('Workshop','2026-03-01','2026-03-05','2026-03-01'),
('Seminar','2026-03-10','2026-03-12','2026-03-08'),
('Hackathon','2026-03-15','2026-03-18','2026-03-15'),
('Conference','2026-03-20','2026-03-22','2026-03-22'),
('Meetup','2026-03-25','2026-03-26','2026-03-29');

SELECT DATEDIFF(end_date, start_date) AS days_diff
FROM events;

SELECT event_name,
DATE_ADD(start_date, INTERVAL 30 DAY) AS expiry_date
FROM Events;

SELECT DATE_SUB(CURDATE(), INTERVAL 7 DAY) AS seven_days_before;

SELECT *
FROM Events
WHERE DAYOFWEEK(created_at) IN (1,7);

SELECT 
MONTHNAME(STR_TO_DATE('25-03-2026','%d-%m-%Y')) AS month_name;