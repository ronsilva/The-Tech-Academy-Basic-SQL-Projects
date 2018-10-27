USE db_zoo
/* DRILL 1 */
SELECT * FROM tbl_habitat;

/* DRILL 2 */
SELECT species_name FROM tbl_species WHERE species_order = 3;

/* DRILL 3 */
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;

/* DRILL 4 */
SELECT * FROM tbl_species;
SELECT species_name
FROM tbl_species t_sp
INNER JOIN 
(
	SELECT t_nu.nutrition_id 
	FROM tbl_nutrition t_nu
	WHERE nutrition_id BETWEEN 2202 AND 2206 
	GROUP BY nutrition_id
) nuV
	ON t_sp.species_nutrition = nuV.nutrition_id
;

/* DRILL 5 */
SELECT 
	sp.species_name 'Species Name:',
	nu.nutrition_type 'Nutrition Type:' 
	FROM tbl_species sp 
	FULL OUTER JOIN tbl_nutrition nu ON sp.species_nutrition = nu.nutrition_id
	WHERE sp.species_nutrition = nu.nutrition_id
;

/* DRILL 6 */
SELECT 
	spec.specialist_fname,
	spec.specialist_lname,
	spec.specialist_contact
	FROM tbl_specialist spec
	INNER JOIN tbl_care ca ON ca.care_specialist = spec.specialist_id
	INNER JOIN tbl_species sp ON sp.species_care = ca.care_id 
	WHERE sp.species_name = 'penguin'
;
/* DRILL 7 */
CREATE DATABASE moviesDB;
USE moviesDB;

CREATE TABLE Movie_Titles (
	ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR(50) NOT NULL,
	Date_of_Release DATE,
);

INSERT INTO Movie_Titles
	(Title, Date_of_Release)
	VALUES
	('The Shawshank Redemption', '1994-10-14'),
	('The Godfather', '1972-03-24'),
	('The Godfather: Part II', '1974-12-20'),
	('The Dark Knight', '2008-07-18'),
	('12 Angry Men ', '1957-04-10')
;

CREATE TABLE Actors (
	ID INT PRIMARY KEY IDENTITY(1,1),
	Full_Name VARCHAR(50) ,
	Movie VARCHAR(50),
);

INSERT INTO Actors 
		(Full_Name, Movie)
		VALUES
		('Tim Robbins', 'The Shawshank Redemption'),
		('Morgan Freeman', 'The Shawshank Redemption'),
		('Marlon Brando', 'The Godfather'),
		('Al Pacino', 'The Godfather'),
		('James Caan', 'The Godfather'),
		('Al Pacino', 'The Godfather: Part II'),
		('James Caan', 'The Godfather: Part II'),
		('Christian Bale','The Dark Knight'),
		('Heath Ledger', 'The Dark Knight'),
		('Morgan Freeman', 'The Dark Knight'),
		('Martin Balsam', '12 Angry Men'),
		('John Fiedler', '12 Angry Men')
;

SELECT
	Full_Name 'Actors',
	Movie,
	Date_of_Release 'Relased On'
FROM Actors a
INNER JOIN Movie_Titles mt ON mt.Title = a.Movie
ORDER BY Full_Name
; 