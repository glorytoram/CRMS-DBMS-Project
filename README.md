# 🚔 Criminal Record Management System (CRMS)

> \\\*"I am the one who normalizes." — Walter White, on 3NF\\\*
> \\\*"The queries are dark and full of errors." — Jon Snow, on SQL\\\*

**NIE Mysuru | Department of Information Science \& Engineering | Batch B1**

|||
|-|-|
|**Authors**|Komal Bishnoi, Kumari Swati Mahato, Kushagra Sharma, Likith Singh S|
|**Guide**|Suhas Bharadwaj BR \& Prathibha BS|
|**Database**|MySQL|
|**Subject**|Database Management Systems (DBMS) Lab Project|

\---

## 📁 Project Structure

```
CRMS-DBMS-Project/

├── schema.sql        → Creates the database and tables

├── insert.sql        → Sample data (themed dataset)

├── queries.sql       → SQL queries covering key concepts

├── er\\\_diagram1.jpg   → ER Diagram (Part 1)

├── er\\\_diagram2.jpg   → ER Diagram (Part 2)

└── README.md         → Project documentation

```

\---

## 🗄️ Database Overview

The **Criminal Record Management System (CRMS)** is a relational database designed to manage and track criminal records, police personnel, evidence, cases, and crimes. It simulates a real-world law enforcement database system.

The system maintains records for:

* Police stations and their jurisdictions
* Police officers and their assignments
* Criminals and their current status
* Crimes with type, severity, and location
* Cases with filing date, status, and assigned officer
* Evidence collected per case
* Many-to-many relationships between criminals↔cases and cases↔crimes

\---

## 🧱 Schema — Tables

### 1\. POLICE\_STATION

Stores details of all police stations including location and jurisdiction.

|Column|Type|Description|
|-|-|-|
|station\_id|INT (PK)|Auto-incremented primary key|
|name|VARCHAR(100)|Station name|
|address|VARCHAR(200)|Full address|
|city|VARCHAR(80)|City|
|contact\_no|VARCHAR(15)|Contact number|
|jurisdiction|VARCHAR(150)|Area of jurisdiction|

\---

### 2\. POLICE\_OFFICER

Stores officer details with a foreign key linking to their station.

|Column|Type|Description|
|-|-|-|
|officer\_id|INT (PK)|Auto-incremented primary key|
|name|VARCHAR(100)|Officer full name|
|rank|VARCHAR(50)|Rank (Inspector, SI, etc.)|
|badge\_no|VARCHAR(20) UNIQUE|Unique badge number|
|station\_id|INT (FK)|References POLICE\_STATION|
|contact|VARCHAR(15)|Phone number|
|email|VARCHAR(100)|Official email|

\---

### 3\. CRIMINAL

Stores personal details and current status of each criminal.

|Column|Type|Description|
|-|-|-|
|criminal\_id|INT (PK)|Auto-incremented primary key|
|first\_name|VARCHAR(80)|First name|
|last\_name|VARCHAR(80)|Last name|
|dob|DATE|Date of birth|
|gender|CHAR(1)|M / F / O|
|address|VARCHAR(200)|Last known address|
|nationality|VARCHAR(60)|Nationality|
|status|ENUM|Wanted / Arrested / Released / Deceased|

\---

### 4\. CRIME

Stores details of each crime committed including type, location, and severity.

|Column|Type|Description|
|-|-|-|
|crime\_id|INT (PK)|Auto-incremented primary key|
|crime\_type|VARCHAR(100)|Type (Theft, Murder, Cybercrime, etc.)|
|description|TEXT|Detailed description|
|date\_occurred|DATE|Date of crime|
|location|VARCHAR(200)|Location of crime|
|severity|ENUM|Low / Medium / High / Critical|

\---

### 5\. CASE

Stores case details with references to the handling officer and station.

|Column|Type|Description|
|-|-|-|
|case\_id|INT (PK)|Auto-incremented primary key|
|case\_title|VARCHAR(200)|Title of the case|
|status|ENUM|Open / Under Investigation / Closed / Dismissed|
|date\_filed|DATE|Date case was filed|
|officer\_id|INT (FK)|References POLICE\_OFFICER|
|station\_id|INT (FK)|References POLICE\_STATION|

\---

### 6\. EVIDENCE

Stores evidence items collected for each case.

|Column|Type|Description|
|-|-|-|
|evidence\_id|INT (PK)|Auto-incremented primary key|
|evidence\_type|VARCHAR(100)|Physical / Digital / Documentary|
|description|TEXT|Description of evidence|
|date\_collected|DATE|Date collected|
|case\_id|INT (FK)|References CASE|
|officer\_id|INT (FK)|References POLICE\_OFFICER|

\---

### 7\. CRIMINAL\_CASE *(Junction Table — M:N)*

Links criminals to cases. A criminal can be in many cases; a case can have many criminals.

|Column|Type|Description|
|-|-|-|
|criminal\_id|INT (PK, FK)|References CRIMINAL|
|case\_id|INT (PK, FK)|References CASE|
|role|VARCHAR(80)|Accused / Convict / Witness|
|arrest\_date|DATE|Date of arrest (nullable)|

\---

### 8\. CASE\_CRIME *(Junction Table — M:N)*

Links cases to crimes. A case can involve many crimes; a crime can appear in many cases.

|Column|Type|Description|
|-|-|-|
|case\_id|INT (PK, FK)|References CASE|
|crime\_id|INT (PK, FK)|References CRIME|

\---

## 🔗 Relationships

|Relationship|Type|Description|
|-|-|-|
|POLICE\_STATION → POLICE\_OFFICER|One-to-Many|One station has many officers|
|POLICE\_STATION → CASE|One-to-Many|One station handles many cases|
|POLICE\_OFFICER → CASE|One-to-Many|One officer is assigned many cases|
|POLICE\_OFFICER → EVIDENCE|One-to-Many|One officer collects many evidence items|
|CASE → EVIDENCE|One-to-Many|One case has many pieces of evidence|
|CRIMINAL ↔ CASE|Many-to-Many|Via CRIMINAL\_CASE junction table|
|CASE ↔ CRIME|Many-to-Many|Via CASE\_CRIME junction table|

\---

## 📊 ER Diagram

\### Part 1

!\[ER Diagram Part 1](er\_diagram1.jpg)



\### Part 2

!\[ER Diagram Part 2](er\_diagram2.jpg)

\---

## 📝 Queries Summary

|#|Query|Concepts Used|
|-|-|-|
|Q1|List all criminals with status|SELECT, ORDER BY|
|Q2|List all WANTED criminals|WHERE filter|
|Q3|Cases with officer and station|3-table INNER JOIN|
|Q4|Criminals linked to each case|Junction table JOIN|
|Q5|Crimes linked to each case|Junction table JOIN|
|Q6|Total cases per police station|LEFT JOIN, GROUP BY, COUNT|
|Q7|Evidence with case and officer|3-table JOIN|
|Q8|Crime count by severity|GROUP BY, ORDER BY FIELD|
|Q9|Critical/High crimes with case status|WHERE IN, multi-table JOIN|
|Q10|Open / Under Investigation cases|WHERE IN filter|
|Q11|Criminals in more than one case|GROUP BY, HAVING|
|Q12|Officers who handled Critical cases|Subquery, DISTINCT|
|Q13|Cases assigned per officer|LEFT JOIN, GROUP BY|
|Q14|Full case report|6-table JOIN|
|Q15|Cases with multiple accused|GROUP BY, HAVING, COUNT|

\---

## ▶️ How to Run

1. Open **MySQL Workbench**
2. Run `schema.sql` first — creates the database and all tables
3. Run `insert.sql` second — inserts all sample data
4. Run `queries.sql` third — execute any or all queries

> Make sure to run them \\\*\\\*in order\\\*\\\*. Running insert before schema will throw errors.

\---

## 🎭 About the Sample Data

The sample dataset features characters from **Breaking Bad** as criminals (Walter White, Jesse Pinkman, Gustavo Fring, Saul Goodman, Skyler White, the Salamancas, Mike Ehrmantraut) and **Game of Thrones** characters as police officers (Jon Snow, Arya Stark, Tyrion Lannister, Cersei, Samwell Tarly) and villains (Joffrey, Ramsay Bolton, Petyr Baelish).

Police stations are named after iconic show locations — The Wall Outpost, Winterfell Police Station, Los Pollos Hermanos Thana — all with real Karnataka addresses.

Crimes include both **common real-world offences** (theft, burglary, drunk driving, domestic violence, cybercrime, hit and run) and **show-accurate crimes** (Walter's KSRTC bus meth lab, Gus's ₹47 crore chicken franchise laundering, Ramsay's Rajajinagar farmhouse kidnapping).

\---

*NIE Mysuru — Department of IS\&E — DBMS Lab Project — 2024*

