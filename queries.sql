-- ============================================================
--  Criminal Record Management System (CRMS)
--  queries.sql  —  NIE Mysuru, Dept. of IS&E, Batch B1
--  Authors : Komal Bishnoi, Kumari Swati Mahato,
--             Kushagra Sharma, Likith Singh S
--  "I am the one who normalizes." — Walter White
--  "The queries are dark and full of errors." — Jon Snow
-- ============================================================

USE crms;

-- Q1. List all criminals with their status
SELECT
    criminal_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    nationality,
    status
FROM CRIMINAL
ORDER BY status, last_name;

-- Q2. List all WANTED criminals
SELECT
    CONCAT(first_name, ' ', last_name) AS full_name,
    address,
    nationality
FROM CRIMINAL
WHERE status = 'Wanted';

-- Q3. List every case with its investigating officer and station
SELECT
    c.case_id,
    c.case_title,
    c.status AS case_status,
    c.date_filed,
    po.name AS officer_name,
    po.rank,
    ps.name AS station_name
FROM `CASE` c
INNER JOIN POLICE_OFFICER  po ON c.officer_id  = po.officer_id
INNER JOIN POLICE_STATION  ps ON c.station_id  = ps.station_id
ORDER BY c.date_filed;

-- Q4. Show all criminals linked to each case (M:N via junction)
SELECT
    c.case_title,
    CONCAT(cr.first_name, ' ', cr.last_name) AS criminal_name,
    cr.status AS criminal_status,
    cc.role,
    cc.arrest_date
FROM CRIMINAL_CASE cc
INNER JOIN `CASE`   c  ON cc.case_id    = c.case_id
INNER JOIN CRIMINAL cr ON cc.criminal_id = cr.criminal_id
ORDER BY c.case_id, cc.role;

-- Q5. Show all crimes linked to each case (M:N via CASE_CRIME)
SELECT
    c.case_title,
    cr.crime_type,
    cr.severity,
    cr.date_occurred,
    cr.location
FROM CASE_CRIME cc
INNER JOIN `CASE` c  ON cc.case_id  = c.case_id
INNER JOIN CRIME  cr ON cc.crime_id = cr.crime_id
ORDER BY c.case_id;

-- Q6. Count total cases handled per police station
SELECT
    ps.name AS station_name,
    ps.city,
    COUNT(c.case_id) AS total_cases
FROM POLICE_STATION ps
LEFT JOIN `CASE` c ON ps.station_id = c.station_id
GROUP BY ps.station_id, ps.name, ps.city
ORDER BY total_cases DESC;

-- Q7. Show all evidence with case title and collecting officer
SELECT
    e.evidence_id,
    e.evidence_type,
    e.description,
    e.date_collected,
    c.case_title,
    po.name AS collected_by
FROM EVIDENCE e
INNER JOIN `CASE`        c  ON e.case_id    = c.case_id
INNER JOIN POLICE_OFFICER po ON e.officer_id = po.officer_id
ORDER BY e.date_collected;

-- Q8. Count crimes by severity level
SELECT
    severity,
    COUNT(*) AS total_crimes
FROM CRIME
GROUP BY severity
ORDER BY FIELD(severity, 'Critical', 'High', 'Medium', 'Low');

-- Q9. List all Critical or High severity crimes with their case status
SELECT
    cr.crime_type,
    cr.severity,
    cr.location,
    cr.date_occurred,
    c.case_title,
    c.status AS case_status
FROM CRIME cr
INNER JOIN CASE_CRIME cc ON cr.crime_id = cc.crime_id
INNER JOIN `CASE`     c  ON cc.case_id  = c.case_id
WHERE cr.severity IN ('Critical', 'High')
ORDER BY cr.severity, cr.date_occurred;

-- Q10. Find all Open or Under Investigation cases
SELECT
    c.case_id,
    c.case_title,
    c.status,
    c.date_filed,
    po.name AS officer_name,
    ps.name AS station_name
FROM `CASE` c
INNER JOIN POLICE_OFFICER po ON c.officer_id = po.officer_id
INNER JOIN POLICE_STATION ps ON c.station_id = ps.station_id
WHERE c.status IN ('Open', 'Under Investigation')
ORDER BY c.status, c.date_filed;

-- Q11. Find criminals involved in more than one case
SELECT
    CONCAT(cr.first_name, ' ', cr.last_name) AS criminal_name,
    cr.status,
    COUNT(cc.case_id) AS number_of_cases
FROM CRIMINAL cr
INNER JOIN CRIMINAL_CASE cc ON cr.criminal_id = cc.criminal_id
GROUP BY  cr.criminal_id, cr.first_name, cr.last_name, cr.status
HAVING    COUNT(cc.case_id) > 1
ORDER BY  number_of_cases DESC;

-- Q12. Find officers who have investigated at least one Critical case
SELECT DISTINCT
    po.officer_id,
    po.name AS officer_name,
    po.rank,
    ps.name AS station_name
FROM POLICE_OFFICER po
INNER JOIN POLICE_STATION ps ON po.station_id = ps.station_id
WHERE po.officer_id IN (
    SELECT c.officer_id
    FROM `CASE` c
    INNER JOIN CASE_CRIME cc ON c.case_id   = cc.case_id
    INNER JOIN CRIME       cr ON cc.crime_id = cr.crime_id
    WHERE cr.severity = 'Critical'
);

-- Q13. Count the number of cases each officer is handling
SELECT
    po.name AS officer_name,
    po.rank,
    ps.name AS station_name,
    COUNT(c.case_id) AS cases_assigned
FROM POLICE_OFFICER  po
INNER JOIN POLICE_STATION ps ON po.station_id = ps.station_id
LEFT  JOIN `CASE`         c  ON po.officer_id = c.officer_id
GROUP BY  po.officer_id, po.name, po.rank, ps.name
ORDER BY  cases_assigned DESC;

-- Q14. Full case report — 6-table JOIN
SELECT
    c.case_title,
    c.status AS case_status,
    po.name AS officer,
    ps.name AS station,
    CONCAT(cr.first_name, ' ', cr.last_name) AS criminal,
    cc_link.role,
    crime.crime_type,
    crime.severity
FROM `CASE` c
INNER JOIN POLICE_OFFICER  po      ON c.officer_id        = po.officer_id
INNER JOIN POLICE_STATION  ps      ON c.station_id        = ps.station_id
INNER JOIN CRIMINAL_CASE   cc_link ON c.case_id           = cc_link.case_id
INNER JOIN CRIMINAL        cr      ON cc_link.criminal_id = cr.criminal_id
INNER JOIN CASE_CRIME       cc2    ON c.case_id           = cc2.case_id
INNER JOIN CRIME            crime  ON cc2.crime_id        = crime.crime_id
ORDER BY c.case_id, cr.last_name;

-- Q15. Find cases where multiple criminals are accused
SELECT
    c.case_title,
    c.status,
    COUNT(cc.criminal_id) AS number_of_accused
FROM `CASE` c
INNER JOIN CRIMINAL_CASE cc ON c.case_id = cc.case_id
GROUP BY   c.case_id, c.case_title, c.status
HAVING     COUNT(cc.criminal_id) > 1
ORDER BY   number_of_accused DESC;

-- ============================================================
--  End of queries.sql
--  "I am the one who normalizes."  — Walter White, on 3NF
--  "The queries are dark and full of errors." — Jon Snow, on SQL
-- ============================================================