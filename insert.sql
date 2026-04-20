-- ============================================================
--  Criminal Record Management System (CRMS)
--  insert.sql  —  Large Sample Data
--  NIE Mysuru, Dept. of IS&E, Batch B1
--  (GoT x Breaking Bad Extended Universe — Karnataka Edition)
-- ============================================================

USE crms;

-- ============================================================
--  POLICE_STATION (10 rows)
-- ============================================================
INSERT INTO POLICE_STATION (name, address, city, contact_no, jurisdiction) VALUES
('The Wall Police Outpost',          'Narakasura Road, Near Mysuru Fort, Mysuru',          'Mysuru',    '0821-2420100', 'Mysuru City Central'),
('Winterfell Police Station',        'Chamundi Hills Road, Mysuru',                         'Mysuru',    '0821-2570150', 'Chamundi & Hebbal Zone'),
('Los Pollos Hermanos Thana',        '80 Feet Road, Koramangala, Bengaluru',                'Bengaluru', '080-25530585', 'Koramangala 1-8 Block'),
('The Red Keep Police Station',      'Balmatta Road, Mangaluru',                            'Mangaluru', '0824-2440100', 'Mangaluru East Zone'),
('Vaes Dothrak Rural Outpost',       'Station Road, Hubballi',                              'Hubballi',  '0836-2362100', 'Hubballi Rural Taluk'),
('Castle Black Traffic Division',    'KRS Road, Near Brindavan Gardens, Mysuru',            'Mysuru',    '0821-2521100', 'KRS Road & Outskirts'),
('Dragonstone Cyber Cell',           'MG Road, Bengaluru',                                  'Bengaluru', '080-22221234', 'MG Road Tech Corridor'),
('Kings Landing Metro Police',       'Brigade Road, Bengaluru',                             'Bengaluru', '080-22334455', 'Brigade & Church Street'),
('Dorne Border Check Post',          'NH-75, Shiradi Ghat, Sakleshpur',                     'Hassan',    '08173-222100', 'Sakleshpur & Ghat Section'),
('Iron Islands Marine Police',       'Old Port Road, Mangaluru',                            'Mangaluru', '0824-2451200', 'Mangaluru Port & Coastal');

-- ============================================================
--  POLICE_OFFICER (15 rows)
-- ============================================================
INSERT INTO POLICE_OFFICER (name, rank, badge_no, station_id, contact, email) VALUES
('Jon Snow',           'Inspector',           'KA-MYS-001',  1, '9845001001', 'jon.snow@ksp.gov.in'),
('Arya Stark',         'Sub-Inspector',       'KA-MYS-002',  2, '9845002002', 'arya.stark@ksp.gov.in'),
('Tyrion Lannister',   'Deputy Inspector',    'KA-BLR-003',  3, '9845003003', 'tyrion.lannister@ksp.gov.in'),
('Cersei Lannister',   'Inspector',           'KA-MNG-004',  4, '9845004004', 'cersei.lannister@ksp.gov.in'),
('Samwell Tarly',      'Head Constable',      'KA-HBL-005',  5, '9845005005', 'samwell.tarly@ksp.gov.in'),
('Ned Stark',          'Superintendent',      'KA-MYS-006',  1, '9845006006', 'ned.stark@ksp.gov.in'),
('Sansa Stark',        'Sub-Inspector',       'KA-MYS-007',  2, '9845007007', 'sansa.stark@ksp.gov.in'),
('The Hound',          'Head Constable',      'KA-BLR-008',  8, '9845008008', 'sandor.clegane@ksp.gov.in'),
('Brienne Tarth',      'Inspector',           'KA-MNG-009',  4, '9845009009', 'brienne.tarth@ksp.gov.in'),
('Davos Seaworth',     'Sub-Inspector',       'KA-HBL-010',  6, '9845010010', 'davos.seaworth@ksp.gov.in'),
('Jaime Lannister',    'Deputy Inspector',    'KA-BLR-011',  8, '9845011011', 'jaime.lannister@ksp.gov.in'),
('Olenna Tyrell',      'Superintendent',      'KA-MNG-012',  4, '9845012012', 'olenna.tyrell@ksp.gov.in'),
('Bronn',              'Head Constable',      'KA-BLR-013',  3, '9845013013', 'bronn.of.blackwater@ksp.gov.in'),
('Missandei',          'Sub-Inspector',       'KA-MYS-014',  2, '9845014014', 'missandei@ksp.gov.in'),
('Varys',              'Intelligence Officer','KA-BLR-015',  7, '9845015015', 'lord.varys@ksp.gov.in');

-- ============================================================
--  CRIMINAL (20 rows)
--  Breaking Bad characters + GoT villains as criminals
-- ============================================================
INSERT INTO CRIMINAL (first_name, last_name, dob, gender, address, nationality, status) VALUES
('Walter',    'White',       '1959-09-07', 'M', '308, Negra Arroyo Lane, Devaraja Market Area, Mysuru',       'American', 'Arrested'),
('Jesse',     'Pinkman',     '1984-09-24', 'M', '9809, Margo Street, Vijayanagar 2nd Stage, Mysuru',          'American', 'Wanted'),
('Gustavo',   'Fring',       '1958-11-17', 'M', 'Los Pollos Outlet, Koramangala 4th Block, Bengaluru',        'Chilean',  'Released'),
('Saul',      'Goodman',     '1960-11-12', 'M', 'Wexler-McGill Bldg, MG Road, Mangaluru',                     'American', 'Arrested'),
('Skyler',    'White',       '1970-08-11', 'F', '308, Negra Arroyo Lane, Devaraja Market Area, Mysuru',       'American', 'Wanted'),
('Hector',    'Salamanca',   '1940-01-01', 'M', 'Salamanca Compound, Near APMC Yard, Hubballi',               'Mexican',  'Arrested'),
('Tuco',      'Salamanca',   '1975-05-05', 'M', 'Salamanca Compound, Near APMC Yard, Hubballi',               'Mexican',  'Arrested'),
('Mike',      'Ehrmantraut', '1945-04-03', 'M', 'Quiet Corner, Jayanagar 9th Block, Bengaluru',               'American', 'Released'),
('Todd',      'Alquist',     '1990-08-20', 'M', 'Aryan Brotherhood Chawl, Yelahanka, Bengaluru',              'American', 'Arrested'),
('Lydia',     'Rodarte-Quayle','1977-03-22','F', 'Madrigal Electromotive Office, Whitefield, Bengaluru',      'American', 'Wanted'),
('Joffrey',   'Baratheon',   '1987-05-01', 'M', 'Red Keep Apartments, Brigade Road, Bengaluru',               'Westerosi','Arrested'),
('Cersei',    'Lannister',   '1973-10-15', 'F', 'Red Keep Apartments, Brigade Road, Bengaluru',               'Westerosi','Wanted'),
('Petyr',     'Baelish',     '1970-07-07', 'M', 'Littlefinger Enterprises, Commercial Street, Bengaluru',    'Westerosi','Wanted'),
('Ramsay',    'Bolton',      '1989-03-20', 'M', 'Dreadfort Layout, Rajajinagar, Bengaluru',                   'Westerosi','Arrested'),
('Theon',     'Greyjoy',     '1988-11-10', 'M', 'Iron Islands Hostel, Old Port Road, Mangaluru',              'Westerosi','Released'),
('Gregor',    'Clegane',     '1975-06-25', 'M', 'Mountain Quarters, Anekal, Bengaluru',                       'Westerosi','Arrested'),
('Euron',     'Greyjoy',     '1969-08-14', 'M', 'Iron Islands Hostel, Old Port Road, Mangaluru',              'Westerosi','Wanted'),
('Cersei',    'Tywin',       '1943-11-06', 'M', 'Lannister Towers, Lavelle Road, Bengaluru',                  'Westerosi','Released'),
('Viserys',   'Targaryen',   '1983-06-01', 'M', 'Vaes Dothrak PG, Hubballi Bus Stand Area, Hubballi',        'Westerosi','Arrested'),
('Jaqen',     'H ghar',      '1978-01-01', 'M', 'House of Black and White, Russell Market, Bengaluru',        'Unknown',  'Wanted');

-- ============================================================
--  CRIME (25 rows)
--  Mix of common crimes + show-accurate crimes
-- ============================================================
INSERT INTO CRIME (crime_type, description, date_occurred, location, severity) VALUES
-- Common crimes
('Theft',
 'Mobile phone snatched near Devaraja Market bus stand; accused fled on a scooty',
 '2024-01-05', 'Devaraja Market, Mysuru', 'Low'),

('Burglary',
 'House broken into while family was attending a wedding; TV, jewellery, and a pressure cooker stolen',
 '2024-01-18', 'Vijayanagar 3rd Stage, Mysuru', 'Medium'),

('Vehicle Theft',
 'Honda Activa stolen from parking area outside Mysuru railway station at 11 PM',
 '2024-01-22', 'Mysuru Railway Station, Mysuru', 'Medium'),

('Assault',
 'Two neighbours came to blows over a parking dispute; one hospitalised with minor injuries',
 '2024-02-03', 'Hebbal Layout, Mysuru', 'Medium'),

('Domestic Violence',
 'Repeated physical and verbal abuse of spouse reported by victim; children also present during incident',
 '2024-02-10', 'Kuvempunagar, Mysuru', 'High'),

('Drunk Driving',
 'Accused drove Innova at 120 kmph on city road at 2 AM; failed breathalyser test spectacularly',
 '2024-02-20', 'Hunsur Road, Mysuru', 'Medium'),

('Cheating / Fraud',
 'Fake job offer letters issued to 30 unemployed youth; each paid ₹25,000 as processing fee and received absolutely nothing',
 '2024-03-01', 'Vijayanagar 4th Stage, Mysuru', 'High'),

('Cybercrime',
 'Victim received a call from "RBI officer" and transferred ₹4.8 lakh before realising it was a scam',
 '2024-03-12', 'Gokulam, Mysuru', 'High'),

('Robbery',
 'Armed robbery at a gold shop; two accused on bike snatched a chain from a customer and sped away',
 '2024-03-25', 'Sayyaji Rao Road, Mysuru', 'High'),

('Hit and Run',
 'Speeding car knocked down a pedestrian near a school zone and fled; CCTV footage recovered',
 '2024-04-02', 'Nazarbad, Mysuru', 'High'),

('Trespassing',
 'Accused broke into neighbour\'s house repeatedly to steal WiFi password and eat from their fridge',
 '2024-04-08', 'Jayalakshmipuram, Mysuru', 'Low'),

('Public Nuisance',
 'Accused played Kannada film songs at 110 decibels past midnight during a birthday party; 14 complaints filed by residents',
 '2024-04-14', 'Srirampura, Mysuru', 'Low'),

-- Breaking Bad crimes
('Drug Manufacturing',
 'Walter White found operating a meth lab inside a KSRTC bus; told conductor he was a chemistry teacher conducting a "practical exam"',
 '2024-01-10', 'Devaraja Market Bus Stand, Mysuru', 'Critical'),

('Drug Possession',
 'Jesse Pinkman arrested with a large quantity of blue-tinted crystalline substance labelled "Rock Candy — Not Meth"; label was handwritten',
 '2024-02-14', 'Vijayanagar 4th Stage, Mysuru', 'High'),

('Money Laundering',
 'Gustavo Fring operated an immaculate chicken franchise as a front; forensic accountants found ₹47 crore in unaccounted turnover hidden inside weekly chicken delivery invoices',
 '2024-03-05', 'Koramangala, Bengaluru', 'Critical'),

('Fraud & Illegal Counsel',
 'Saul Goodman provided dubious legal advice to 60 clients in one afternoon from a mall food court; business card read "Criminal Lawyer — emphasis on Criminal"',
 '2024-04-20', 'Balmatta Road, Mangaluru', 'Medium'),

('Financial Fraud',
 'Skyler White laundered drug money through A1A Car Wash; gave customers ₹500 receipts for ₹50 washes; staff told to "not ask questions"',
 '2024-05-01', 'Station Road, Hubballi', 'High'),

('Drug Trafficking',
 'Hector Salamanca and Tuco Salamanca ran a cross-state cartel supply chain; Hector communicated orders exclusively by ringing a bell; took 40 minutes per instruction',
 '2024-05-10', 'APMC Yard, Hubballi', 'Critical'),

('Contract Killing',
 'Mike Ehrmantraut suspected of eliminating three Madrigal executives; left no evidence, no witnesses, and a very clean crime scene; police found one sunflower seed',
 '2024-05-18', 'Jayanagar, Bengaluru', 'Critical'),

('Obstruction of Justice',
 'Todd Alquist deleted CCTV footage from 4 locations, bribed two witnesses, and cheerfully offered arresting officers homemade biscuits',
 '2024-06-01', 'Yelahanka, Bengaluru', 'High'),

-- Game of Thrones crimes
('Assault & Attempt to Murder',
 'Joffrey Baratheon assaulted a street vendor for not bowing; ordered his guards to arrest the crowd for "witnessing his embarrassment"',
 '2024-06-10', 'Brigade Road, Bengaluru', 'High'),

('Extortion',
 'Petyr Baelish ran a large extortion racket under the cover of a real estate firm; victims were noblemen, merchants, and one confused software engineer',
 '2024-06-20', 'Commercial Street, Bengaluru', 'Critical'),

('Kidnapping & Torture',
 'Ramsay Bolton abducted a rival and held him captive for 3 weeks in a Rajajinagar farmhouse; complained the screaming "disrupted his sleep schedule"',
 '2024-07-01', 'Rajajinagar, Bengaluru', 'Critical'),

('Arms Smuggling',
 'Euron Greyjoy intercepted near Mangaluru port with a shipment of illegal weapons hidden under 400 kg of dried fish; said he was a fisherman',
 '2024-07-10', 'Old Port Road, Mangaluru', 'Critical'),

('Murder',
 'Gregor Clegane accused of killing three men during a road rage incident on NICE Road; witnesses described the accused as "very large and unhappy about traffic"',
 '2024-07-20', 'NICE Road, Bengaluru', 'Critical');

-- ============================================================
--  CASE (20 rows)
-- ============================================================
INSERT INTO `CASE` (case_title, status, date_filed, officer_id, station_id) VALUES
('Devaraja Mobile Snatching — State vs Jesse Pinkman',            'Closed',              '2024-01-06',  1,  1),
('Vijayanagar House Burglary — Unknown Accused',                   'Open',                '2024-01-19',  2,  2),
('Mysuru Railway Station Vehicle Theft',                           'Under Investigation', '2024-01-23',  7,  2),
('Hebbal Parking Dispute Assault',                                 'Closed',              '2024-02-04',  5, 10),
('Kuvempunagar Domestic Violence — State vs Viserys Targaryen',   'Under Investigation', '2024-02-11',  1,  1),
('Hunsur Road Drunk Driving — State vs Tuco Salamanca',           'Closed',              '2024-02-21',  6,  6),
('Fake Job Fraud — State vs Petyr Baelish',                       'Under Investigation', '2024-03-02', 15,  7),
('Gokulam KYC Scam — State vs Lydia Rodarte-Quayle',              'Open',                '2024-03-13', 15,  7),
('Sayyaji Rao Gold Chain Robbery — State vs Tuco Salamanca',      'Closed',              '2024-03-26',  4,  4),
('Nazarbad Hit and Run — Unknown Accused',                         'Under Investigation', '2024-04-03',  9,  4),
('Jayalakshmipuram Trespassing — State vs Theon Greyjoy',         'Closed',              '2024-04-09',  2,  2),
('Srirampura Noise Nuisance — State vs Joffrey Baratheon',        'Closed',              '2024-04-15', 14,  2),
('State vs Walter White — The One Who Cooks',                     'Closed',              '2024-01-11',  1,  1),
('State vs Jesse Pinkman — Rock Candy Menace',                    'Under Investigation', '2024-02-15',  2,  2),
('State vs Gustavo Fring — The Chicken & The Crores',             'Open',                '2024-03-06',  3,  3),
('State vs Saul Goodman — Better Call Someone Else',              'Under Investigation', '2024-04-21',  4,  4),
('State vs Skyler White — A1A Dirty Money Car Wash',              'Closed',              '2024-05-02',  5,  5),
('State vs Hector & Tuco Salamanca — Bell Tower Cartel',          'Under Investigation', '2024-05-11',  8, 10),
('State vs Mike Ehrmantraut — The Sunflower Seed Case',           'Open',                '2024-05-19', 11,  8),
('State vs Ramsay Bolton — Rajajinagar Farmhouse Horror',         'Under Investigation', '2024-07-02', 11,  8);

-- ============================================================
--  EVIDENCE (20 rows)
-- ============================================================
INSERT INTO EVIDENCE (evidence_type, description, date_collected, case_id, officer_id) VALUES
('Physical',    'Stolen Samsung S23 recovered from accused; screen cracked, lock screen changed to a selfie of Jesse',                                   '2024-01-07',  1,  1),
('Physical',    'Broken window latch, muddy footprints size 10, missing pressure cooker (recovered 2 weeks later from a pawn shop)',                      '2024-01-20',  2,  2),
('Physical',    'CCTV footage from railway station parking; Activa spotted being pushed by two men who then rode away calmly',                            '2024-01-24',  3,  7),
('Documentary', 'Medical certificate for victim, two broken side mirrors from the parking spot, and 11 WhatsApp arguments screenshots',                   '2024-02-05',  4,  5),
('Physical',    'Medical report of spouse, children\'s statements, and a broken vase from the living room',                                               '2024-02-12',  5,  1),
('Physical',    'Breathalyser result: 287 mg/100 ml (legal limit: 30); accused asked officer "is that a lot?"',                                          '2024-02-22',  6,  6),
('Documentary', '30 fake offer letters, 30 payment receipts totalling ₹7.5 lakh, one rubber stamp reading "Definitely Real Company Pvt. Ltd."',          '2024-03-03',  7, 15),
('Digital',     'Call recordings, screen-recorded transaction from victim\'s phone, and a fake RBI letterhead downloaded from Google Images',             '2024-03-14',  8, 15),
('Physical',    'CCTV footage of bike-borne accused, recovered gold chain (22 carat), and a discarded helmet with no visor',                             '2024-03-27',  9,  4),
('Physical',    'CCTV from school zone, tyre marks, and a broken side mirror left at the spot with the car\'s registration plate still attached',        '2024-04-04', 10,  9),
('Digital',     'WiFi router logs showing repeated unauthorised access, fridge inventory discrepancy report filed by victim',                             '2024-04-10', 11,  2),
('Physical',    'Decibel meter reading: 114 dB at midnight; 14 written complaints from residents; one noise-cancelling headphone (broken)',               '2024-04-16', 12, 14),
('Physical',    'Yellow hazmat suit, Heisenberg pork pie hat, 2 gas masks, and a bag of blue crystals labelled "Not Meth (Please)"',                     '2024-01-12', 13,  1),
('Physical',    'Half-eaten Funyuns packet, broken RV mirror, handwritten note: "Yo Mr. White, lab is on the bus, dont text"',                           '2024-02-16', 14,  2),
('Digital',     'Dual-layer accounting sheets, hidden drop-point GPS coordinates found in walk-in freezer behind the coleslaw',                           '2024-03-07', 15,  3),
('Documentary', 'Business cards reading "Criminal Lawyer — emphasis on Criminal", 60 retainer agreements, 3 burner phones',                              '2024-04-22', 16,  4),
('Physical',    'Car wash receipts for ₹12 crore in cash, a log book labelled "Walt Whitman Fan Club Donations", lavender-scented cash bundles',         '2024-05-03', 17,  5),
('Physical',    'Ledger with bell-ring codes, 2 kg blue meth, and Hector\'s wheelchair which had a hidden compartment under the seat cushion',           '2024-05-12', 18,  8),
('Physical',    'One sunflower seed. No other evidence. Forensics baffled.',                                                                              '2024-05-20', 19, 11),
('Physical',    'Photographs of the farmhouse, chain marks, victim statement, and a handwritten apology note from Ramsay calling it "a misunderstanding"','2024-07-03', 20, 11);

-- ============================================================
--  CRIMINAL_CASE  (Junction — 30 rows)
-- ============================================================
INSERT INTO CRIMINAL_CASE (criminal_id, case_id, role, arrest_date) VALUES
-- Common crime cases
(2,  1,  'Accused',  '2024-01-07'),   -- Jesse nabbed for mobile snatching (side hustle)
(13, 7,  'Accused',  '2024-03-05'),   -- Petyr Baelish — fake job fraud, naturally
(10, 8,  'Accused',  NULL),           -- Lydia — KYC scam; whereabouts unknown
(7,  6,  'Accused',  '2024-02-22'),   -- Tuco drunk driving; wrestled with 3 officers
(7,  9,  'Accused',  '2024-03-27'),   -- Tuco also did the gold chain robbery
(15, 11, 'Accused',  '2024-04-10'),   -- Theon Greyjoy — trespassing (long story)
(11, 12, 'Accused',  '2024-04-16'),   -- Joffrey noise nuisance; refused to turn it down
(19, 5,  'Accused',  '2024-02-13'),   -- Viserys — domestic violence; very on-brand
-- Breaking Bad cases
(1,  13, 'Accused',  '2024-01-13'),   -- Walter White: "I am the danger. I am the one who cooks."
(2,  14, 'Accused',  '2024-02-20'),   -- Jesse: arrested, bailed out, immediately re-arrested
(3,  15, 'Accused',  NULL),           -- Gus: released — perfect alibi, 200 chicken pieces, no prints
(4,  16, 'Accused',  '2024-04-23'),   -- Saul: arrested; immediately filed case against arresting officer
(5,  17, 'Witness',  NULL),           -- Skyler: turned approver; blamed Walt for everything (fair)
(6,  18, 'Accused',  '2024-05-13'),   -- Hector: arrested; took 55 minutes to confirm his name via bell
(7,  18, 'Accused',  '2024-05-13'),   -- Tuco: arrested alongside Hector; third arrest this insert
(8,  19, 'Accused',  NULL),           -- Mike: released; left one sunflower seed at scene
(9,  19, 'Accused',  '2024-06-02'),   -- Todd: arrested; offered biscuits to judge as well
(2,  13, 'Accused',  NULL),           -- Jesse also linked to Walter's main case (obviously)
(1,  17, 'Accused',  NULL),           -- Walter's meth income ran through Skyler's car wash too
(10, 15, 'Accused',  NULL),           -- Lydia linked to Gus's laundering via Madrigal
-- GoT villain cases
(11, 12, 'Accused',  '2024-04-16'),   -- Joffrey — noise case (already listed, also assault pending)
(12, 7,  'Accused',  NULL),           -- Cersei Lannister suspected in fraud case; untouchable as usual
(13, 7,  'Convict',  '2024-03-05'),   -- Petyr Baelish convicted on fraud (multiple counts)
(14, 20, 'Accused',  '2024-07-02'),   -- Ramsay Bolton — farmhouse kidnapping
(15, 11, 'Accused',  '2024-04-10'),   -- Theon — trespassing (second entry for role clarity)
(16, 25, 'Accused',  '2024-07-21'),   -- Gregor Clegane — road rage murders
(17, 18, 'Accused',  NULL),           -- Euron Greyjoy linked to Salamanca cartel arms supply
(4,  7,  'Witness',  NULL),           -- Saul Goodman was a witness in fraud case (and somehow profited)
(8,  16, 'Witness',  NULL),           -- Mike witnessed Saul's arrest and said absolutely nothing
(20, 8,  'Accused',  NULL);           -- Jaqen H'ghar suspected in KYC scam; identity unverified

-- ============================================================
--  CASE_CRIME  (Junction — 28 rows)
-- ============================================================
INSERT INTO CASE_CRIME (case_id, crime_id) VALUES
(1,  1),   -- Snatching case → Theft
(2,  2),   -- Burglary case → Burglary
(3,  3),   -- Vehicle theft → Vehicle Theft
(4,  4),   -- Parking assault → Assault
(5,  5),   -- Domestic violence case
(6,  6),   -- Drunk driving
(7,  7),   -- Fake job fraud
(8,  8),   -- KYC cybercrime
(9,  9),   -- Gold chain robbery
(10, 10),  -- Hit and run
(11, 11),  -- Trespassing
(12, 12),  -- Noise nuisance
(13, 13),  -- Walter — drug manufacturing
(14, 14),  -- Jesse — drug possession
(15, 15),  -- Gus — money laundering
(16, 16),  -- Saul — fraud
(17, 17),  -- Skyler — financial fraud
(18, 18),  -- Salamancas — drug trafficking
(19, 19),  -- Mike — contract killing
(19, 20),  -- Mike — obstruction also linked
(20, 23),  -- Ramsay — kidnapping & torture
(13, 15),  -- Walter's meth also involved in laundering (Skyler's car wash)
(18, 4),   -- Salamanca cartel also linked to assault of witnesses
(16, 7),   -- Saul's fraud overlaps with the fake job fraud ring
(7,  22),  -- Petyr Baelish extortion case also linked to extortion crime record
(9,  4),   -- Gold robbery also involved assault of the victim
(6,  4),   -- Drunk driving caused minor assault on traffic officer
(8,  7);   -- KYC scam also classified under general fraud

-- ============================================================
--  End of insert.sql
--  "I am the one who normalizes." — Walter White, on database design
--  "The queries are dark and full of errors." — Jon Snow, on SQL
-- ============================================================