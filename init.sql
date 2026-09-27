-- ============================================================
-- Telugu Film Industry Heroes & Salary Database
-- File: telugu_heroes_salary.sql
-- Database: MySQL / MariaDB
-- ============================================================

DROP DATABASE IF EXISTS telugu_cinema;
CREATE DATABASE telugu_cinema;
USE telugu_cinema;

-- ============================================================
-- Table 1: Heroes (Actors)
-- ============================================================
CREATE TABLE heroes (
    hero_id         INT AUTO_INCREMENT PRIMARY KEY,
    hero_name       VARCHAR(100) NOT NULL,
    nickname        VARCHAR(100),
    date_of_birth   DATE,
    debut_year      YEAR,
    native_place    VARCHAR(100),
    active_status   ENUM('Active', 'Semi-Active', 'Retired') DEFAULT 'Active',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- Table 2: Movies
-- ============================================================
CREATE TABLE movies (
    movie_id        INT AUTO_INCREMENT PRIMARY KEY,
    movie_name      VARCHAR(150) NOT NULL,
    release_year    YEAR,
    hero_id         INT,
    director        VARCHAR(100),
    budget_crores   DECIMAL(10,2),
    box_office_cr   DECIMAL(10,2),
    verdict         ENUM('Blockbuster','Hit','Average','Flop') DEFAULT 'Average',
    FOREIGN KEY (hero_id) REFERENCES heroes(hero_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- ============================================================
-- Table 3: Salary Details
-- ============================================================
CREATE TABLE salaries (
    salary_id       INT AUTO_INCREMENT PRIMARY KEY,
    hero_id         INT,
    movie_id        INT,
    salary_crores   DECIMAL(10,2) NOT NULL,
    year            YEAR,
    remarks         VARCHAR(255),
    FOREIGN KEY (hero_id) REFERENCES heroes(hero_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- ============================================================
-- Insert Heroes Data
-- ============================================================
INSERT INTO heroes (hero_name, nickname, date_of_birth, debut_year, native_place, active_status) VALUES
('Prabhas',            'Darling',        '1979-10-23', 2002, 'Hyderabad',   'Active'),
('Mahesh Babu',        'Prince',         '1975-08-09', 1979, 'Chennai',     'Active'),
('Pawan Kalyan',       'Power Star',     '1971-09-02', 1996, 'Bapatla',     'Semi-Active'),
('Allu Arjun',         'Icon Star',      '1982-04-08', 2003, 'Chennai',     'Active'),
('Ram Charan',         'Global Star',    '1985-03-27', 2007, 'Madras',      'Active'),
('NTR Jr',             'Man of Masses',  '1983-05-20', 2001, 'Hyderabad',   'Active'),
('Vijay Deverakonda',  'Rowdy',          '1989-05-09', 2011, 'Hyderabad',   'Active'),
('Ravi Teja',          'Mass Maharaja',  '1968-01-26', 1990, 'Jaggayyapeta','Active'),
('Nani',               'Natural Star',   '1984-02-24', 2008, 'Hyderabad',   'Active'),
('Balakrishna',        'Balayya Babu',   '1960-06-10', 1974, 'Madras',      'Active'),
('Chiranjeevi',        'Megastar',       '1955-08-22', 1978, 'Mogalthur',   'Semi-Active'),
('Nagarjuna',          'King',           '1959-08-29', 1986, 'Chennai',     'Active'),
('Venkatesh',          'Victory Venkatesh','1960-12-13',1986,'Chennai',     'Active'),
('Sudeep',             'Kiccha',         '1973-09-02', 1996, 'Shimoga',     'Active'),
('Rana Daggubati',     'Bhallaladeva',   '1984-12-14', 2010, 'Chennai',     'Active');

-- ============================================================
-- Insert Movies Data
-- ============================================================
INSERT INTO movies (movie_name, release_year, hero_id, director, budget_crores, box_office_cr, verdict) VALUES
('Baahubali: The Beginning',   2015, 1, 'S.S. Rajamouli', 180.00, 650.00, 'Blockbuster'),
('Baahubali: The Conclusion',  2017, 1, 'S.S. Rajamouli', 250.00, 1800.00,'Blockbuster'),
('Saaho',                      2019, 1, 'Sujeeth',        350.00, 440.00, 'Average'),
('Salaar',                     2023, 1, 'Prashanth Neel', 270.00, 615.00, 'Hit'),
('Kalki 2898 AD',              2024, 1, 'Nag Ashwin',     600.00, 1100.00,'Blockbuster'),
('Pokiri',                     2006, 2, 'Puri Jagannadh', 12.00,  66.00,  'Blockbuster'),
('Srimanthudu',                2015, 2, 'Koratala Siva',  70.00,  180.00, 'Blockbuster'),
('Bharat Ane Nenu',            2018, 2, 'Koratala Siva',  90.00,  150.00, 'Hit'),
('Sarileru Neekevvaru',        2020, 2, 'Anil Ravipudi',  75.00,  260.00, 'Blockbuster'),
('Guntur Kaaram',              2024, 2, 'Trivikram',      200.00, 180.00, 'Average'),
('Gabbar Singh',               2012, 3, 'Harish Shankar', 25.00,  150.00, 'Blockbuster'),
('Attarintiki Daredi',         2013, 3, 'Trivikram',      55.00,  185.00, 'Blockbuster'),
('Vakeel Saab',                2021, 3, 'Venu Sriram',    70.00,  140.00, 'Hit'),
('Arya',                       2004, 4, 'Sukumar',        4.00,   14.00,  'Hit'),
('Race Gurram',                2014, 4, 'Surender Reddy', 40.00,  100.00, 'Blockbuster'),
('Ala Vaikunthapurramuloo',    2020, 4, 'Trivikram',      100.00, 265.00, 'Blockbuster'),
('Pushpa: The Rise',           2021, 4, 'Sukumar',        200.00, 365.00, 'Blockbuster'),
('Pushpa 2: The Rule',         2024, 4, 'Sukumar',        500.00, 1800.00,'Blockbuster'),
('Magadheera',                 2009, 5, 'S.S. Rajamouli', 35.00,  150.00, 'Blockbuster'),
('Rangasthalam',               2018, 5, 'Sukumar',        60.00,  216.00, 'Blockbuster'),
('RRR',                        2022, 5, 'S.S. Rajamouli', 550.00, 1200.00,'Blockbuster'),
('Game Changer',               2025, 5, 'Shankar',        400.00, 200.00, 'Average'),
('Aravinda Sametha',           2018, 6, 'Trivikram',      75.00,  160.00, 'Hit'),
('RRR',                        2022, 6, 'S.S. Rajamouli', 550.00, 1200.00,'Blockbuster'),
('Devara',                     2024, 6, 'Koratala Siva',  300.00, 520.00, 'Hit'),
('Arjun Reddy',                2017, 7, 'Sandeep Reddy Vanga',5.00,51.00,'Blockbuster'),
('Geetha Govindam',            2018, 7, 'Parasuram',      15.00,  130.00, 'Blockbuster'),
('Liger',                      2022, 7, 'Puri Jagannadh', 100.00, 80.00,  'Flop'),
('Kushi',                      2023, 7, 'Shiva Nirvana',  50.00,  100.00, 'Hit'),
('Krack',                      2021, 8, 'Gopichand Malineni',30.00,100.00,'Blockbuster'),
('Dhamaka',                    2022, 8, 'Trinadha Rao',   40.00,  80.00,  'Hit'),
('Jersey',                     2019, 9, 'Gowtam Tinnanuri',20.00, 100.00, 'Blockbuster'),
('Shyam Singha Roy',           2021, 9, 'Rahul Sankrityan',40.00, 80.00,  'Hit'),
('Dasara',                     2023, 9, 'Srikanth Odela', 60.00,  120.00, 'Hit'),
('Simha',                      2010, 10,'Boyapati Srinu', 25.00,  80.00,  'Blockbuster'),
('Legend',                     2014, 10,'Boyapati Srinu', 40.00,  100.00, 'Blockbuster'),
('Akhanda',                    2021, 10,'Boyapati Srinu', 70.00,  180.00, 'Blockbuster'),
('Veera Simha Reddy',          2023, 10,'Gopichand Malineni',90.00,150.00,'Hit'),
('Indra',                      2002, 11,'B. Gopal',       15.00,  70.00,  'Blockbuster'),
('Sye Raa Narasimha Reddy',    2019, 11,'Surender Reddy', 270.00, 240.00, 'Average'),
('Waltair Veerayya',           2023, 11,'Bobby Kolli',    120.00, 200.00, 'Hit'),
('Manam',                      2014, 12,'Vikram Kumar',   25.00,  80.00,  'Blockbuster'),
('Soggade Chinni Nayana',      2016, 12,'Kalyan Krishna', 30.00,  100.00, 'Blockbuster'),
('Bangarraju',                 2022, 12,'Kalyan Krishna', 50.00,  90.00,  'Hit'),
('Drushyam',                   2014, 13,'Sripriya',       10.00,  50.00,  'Blockbuster'),
('F2: Fun and Frustration',    2019, 13,'Anil Ravipudi',  40.00,  130.00, 'Blockbuster'),
('Narappa',                    2021, 13,'Srikanth Addala',35.00,  70.00,  'Hit'),
('Eega',                       2012, 14,'S.S. Rajamouli', 30.00,  130.00, 'Blockbuster'),
('Vikram Vedha',               2017, 14,'Pushkar-Gayathri',30.00, 60.00,  'Hit'),
('Baahubali: The Beginning',   2015, 15,'S.S. Rajamouli', 180.00, 650.00, 'Blockbuster'),
('Baahubali: The Conclusion',  2017, 15,'S.S. Rajamouli', 250.00, 1800.00,'Blockbuster');

-- ============================================================
-- Insert Salary Data (in Crores INR)
-- ============================================================
INSERT INTO salaries (hero_id, movie_id, salary_crores, year, remarks) VALUES
-- Prabhas
(1, 3,  30.00, 2019, 'Saaho - high budget multilingual'),
(1, 4,  60.00, 2023, 'Salaar - increased after Baahubali'),
(1, 5, 150.00, 2024, 'Kalki 2898 AD - highest paid in TFI at the time'),
-- Mahesh Babu
(2, 7,  20.00, 2015, 'Srimanthudu'),
(2, 9,  50.00, 2020, 'Sarileru Neekevvaru'),
(2, 10, 75.00, 2024, 'Guntur Kaaram'),
-- Pawan Kalyan
(3, 11, 15.00, 2012, 'Gabbar Singh'),
(3, 13, 50.00, 2021, 'Vakeel Saab'),
-- Allu Arjun
(4, 16, 30.00, 2020, 'Ala Vaikunthapurramuloo'),
(4, 17, 50.00, 2021, 'Pushpa: The Rise'),
(4, 18, 200.00, 2024, 'Pushpa 2: The Rule - profit sharing model'),
-- Ram Charan
(5, 21, 70.00, 2022, 'RRR - including profit share'),
(5, 22, 120.00, 2025, 'Game Changer'),
-- NTR Jr
(6, 24, 70.00, 2022, 'RRR - including profit share'),
(6, 25, 100.00, 2024, 'Devara'),
-- Vijay Deverakonda
(7, 26, 5.00, 2017, 'Arjun Reddy'),
(7, 28, 25.00, 2022, 'Liger'),
-- Ravi Teja
(8, 30, 12.00, 2021, 'Krack'),
(8, 31, 20.00, 2022, 'Dhamaka'),
-- Nani
(9, 32, 8.00, 2019, 'Jersey'),
(9, 34, 20.00, 2023, 'Dasara'),
-- Balakrishna
(10, 37, 25.00, 2021, 'Akhanda'),
(10, 38, 40.00, 2023, 'Veera Simha Reddy'),
-- Chiranjeevi
(11, 40, 50.00, 2019, 'Sye Raa Narasimha Reddy'),
(11, 41, 60.00, 2023, 'Waltair Veerayya'),
-- Nagarjuna
(12, 43, 15.00, 2016, 'Soggade Chinni Nayana'),
(12, 44, 20.00, 2022, 'Bangarraju'),
-- Venkatesh
(13, 46, 20.00, 2019, 'F2'),
(13, 47, 25.00, 2021, 'Narappa'),
-- Sudeep
(14, 48, 10.00, 2012, 'Eega'),
-- Rana Daggubati
(15, 49, 12.00, 2017, 'Baahubali series'),
(15, 50, 15.00, 2017, 'Baahubali: The Conclusion');

-- ============================================================
-- Useful Queries / Views
-- ============================================================

-- View: Hero current salary range
CREATE VIEW hero_salary_summary AS
SELECT 
    h.hero_id,
    h.hero_name,
    h.nickname,
    COUNT(s.salary_id)      AS movies_count,
    MIN(s.salary_crores)    AS min_salary_cr,
    MAX(s.salary_crores)    AS max_salary_cr,
    ROUND(AVG(s.salary_crores), 2) AS avg_salary_cr
FROM heroes h
LEFT JOIN salaries s ON h.hero_id = s.hero_id
GROUP BY h.hero_id, h.hero_name, h.nickname
ORDER BY max_salary_cr DESC;

-- View: Highest paid heroes (latest salary)
CREATE VIEW top_paid_heroes AS
SELECT 
    h.hero_name,
    s.salary_crores,
    s.year,
    m.movie_name
FROM salaries s
JOIN heroes h ON s.hero_id = h.hero_id
JOIN movies m ON s.movie_id = m.movie_id
WHERE s.year = (
    SELECT MAX(s2.year) FROM salaries s2 WHERE s2.hero_id = s.hero_id
)
ORDER BY s.salary_crores DESC;

-- Query: Total industry salary by year
SELECT 
    year,
    COUNT(*) AS num_movies,
    SUM(salary_crores) AS total_salary_cr,
    ROUND(AVG(salary_crores), 2) AS avg_salary_cr
FROM salaries
GROUP BY year
ORDER BY year DESC;

-- Query: Movie ROI (Return on Investment)
SELECT 
    m.movie_name,
    h.hero_name,
    m.budget_crores,
    m.box_office_cr,
    ROUND((m.box_office_cr / m.budget_crores), 2) AS roi_multiplier,
    m.verdict
FROM movies m
JOIN heroes h ON m.hero_id = h.hero_id
ORDER BY roi_multiplier DESC;

-- Query: Top 5 heroes by total box office collection
SELECT 
    h.hero_name,
    COUNT(m.movie_id) AS total_movies,
    SUM(m.box_office_cr) AS total_box_office_cr
FROM heroes h
JOIN movies m ON h.hero_id = m.hero_id
GROUP BY h.hero_id, h.hero_name
ORDER BY total_box_office_cr DESC
LIMIT 5;

-- Query: Heroes whose salary > 50 crores
SELECT 
    h.hero_name,
    h.nickname,
    s.salary_crores,
    m.movie_name,
    s.year
FROM salaries s
JOIN heroes h ON s.hero_id = h.hero_id
JOIN movies m ON s.movie_id = m.movie_id
WHERE s.salary_crores > 50
ORDER BY s.salary_crores DESC;

-- ============================================================
-- End of File
-- ============================================================
