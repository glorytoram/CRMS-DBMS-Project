-- ============================================================
--  Criminal Record Management System (CRMS)
--  schema.sql  —  NIE Mysuru, Dept. of IS&E, Batch B1
--  Authors : Komal Bishnoi, Kumari Swati Mahato,
--             Kushagra Sharma, Likith Singh S
--  Guide   : Suhas Bharadwaj BR & Prathibha BS
-- ============================================================

DROP DATABASE IF EXISTS crms;
CREATE DATABASE crms;
USE crms;

-- ============================================================
--  TABLE 1 : POLICE_STATION
-- ============================================================
CREATE TABLE POLICE_STATION (
    station_id   INT           PRIMARY KEY AUTO_INCREMENT,
    name         VARCHAR(100)  NOT NULL,
    address      VARCHAR(200)  NOT NULL,
    city         VARCHAR(80)   NOT NULL,
    contact_no   VARCHAR(15),
    jurisdiction VARCHAR(150)
);

-- ============================================================
--  TABLE 2 : POLICE_OFFICER
-- ============================================================
CREATE TABLE POLICE_OFFICER (
    officer_id INT          PRIMARY KEY AUTO_INCREMENT,
    name       VARCHAR(100) NOT NULL,
    rank       VARCHAR(50)  NOT NULL,
    badge_no   VARCHAR(20)  NOT NULL UNIQUE,
    station_id INT          NOT NULL,
    contact    VARCHAR(15),
    email      VARCHAR(100),
    CONSTRAINT fk_officer_station
        FOREIGN KEY (station_id)
        REFERENCES POLICE_STATION(station_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================================
--  TABLE 3 : CRIMINAL
-- ============================================================
CREATE TABLE CRIMINAL (
    criminal_id INT          PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(80)  NOT NULL,
    last_name   VARCHAR(80)  NOT NULL,
    dob         DATE,
    gender      CHAR(1)      CHECK (gender IN ('M', 'F', 'O')),
    address     VARCHAR(200),
    nationality VARCHAR(60),
    status      ENUM('Wanted', 'Arrested', 'Released', 'Deceased')
                    NOT NULL DEFAULT 'Wanted'
);

-- ============================================================
--  TABLE 4 : CRIME
-- ============================================================
CREATE TABLE CRIME (
    crime_id      INT          PRIMARY KEY AUTO_INCREMENT,
    crime_type    VARCHAR(100) NOT NULL,
    description   TEXT,
    date_occurred DATE         NOT NULL,
    location      VARCHAR(200) NOT NULL,
    severity      ENUM('Low', 'Medium', 'High', 'Critical')
);

-- ============================================================
--  TABLE 5 : CASE
-- ============================================================
CREATE TABLE `CASE` (
    case_id    INT          PRIMARY KEY AUTO_INCREMENT,
    case_title VARCHAR(200) NOT NULL,
    status     ENUM('Open', 'Under Investigation', 'Closed', 'Dismissed')
                   NOT NULL DEFAULT 'Open',
    date_filed DATE         NOT NULL,
    officer_id INT          NOT NULL,
    station_id INT          NOT NULL,
    CONSTRAINT fk_case_officer
        FOREIGN KEY (officer_id)
        REFERENCES POLICE_OFFICER(officer_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_case_station
        FOREIGN KEY (station_id)
        REFERENCES POLICE_STATION(station_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================================
--  TABLE 6 : EVIDENCE
-- ============================================================
CREATE TABLE EVIDENCE (
    evidence_id    INT          PRIMARY KEY AUTO_INCREMENT,
    evidence_type  VARCHAR(100) NOT NULL,
    description    TEXT,
    date_collected DATE,
    case_id        INT          NOT NULL,
    officer_id     INT          NOT NULL,
    CONSTRAINT fk_evidence_case
        FOREIGN KEY (case_id)
        REFERENCES `CASE`(case_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_evidence_officer
        FOREIGN KEY (officer_id)
        REFERENCES POLICE_OFFICER(officer_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- ============================================================
--  TABLE 7 : CRIMINAL_CASE  (Junction — M:N)
-- ============================================================
CREATE TABLE CRIMINAL_CASE (
    criminal_id  INT         NOT NULL,
    case_id      INT         NOT NULL,
    role         VARCHAR(80),
    arrest_date  DATE,
    PRIMARY KEY (criminal_id, case_id),
    CONSTRAINT fk_cc_criminal
        FOREIGN KEY (criminal_id)
        REFERENCES CRIMINAL(criminal_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_cc_case
        FOREIGN KEY (case_id)
        REFERENCES `CASE`(case_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
--  TABLE 8 : CASE_CRIME  (Junction — M:N)
-- ============================================================
CREATE TABLE CASE_CRIME (
    case_id  INT NOT NULL,
    crime_id INT NOT NULL,
    PRIMARY KEY (case_id, crime_id),
    CONSTRAINT fk_casecrime_case
        FOREIGN KEY (case_id)
        REFERENCES `CASE`(case_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_casecrime_crime
        FOREIGN KEY (crime_id)
        REFERENCES CRIME(crime_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ============================================================
--  End of schema.sql
-- ============================================================