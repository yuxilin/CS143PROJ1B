--violates the primary key constraint on Actor.id because id 1 already exists in the table
--output: ERROR 1062 (23000): Duplicate entry '1' for key 1
INSERT INTO Actor VALUES (1, "Aa", "SAM", "Female", 1966-09-17, NULL);

--violates the foreign key constraint on MovieDirector.mid because mid 1 does not exist in Movie.id
--output: ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143/MovieDirector`, CONSTRAINT `MovieDirector_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`))
INSERT INTO MovieDirector VALUES (1, 112);

--violates the foreign key constraint on MovieActor.mid because mid 1 does
--output: ERROR 1452 (23000): Cannot add or update a child row: a foreign key
INSERT INTO MovieActor VALUES(1, 10208, "Doorman");

--violates the check constraint on Movie.id because id is greater than 4750
INSERT INTO Movie (id) VALUE (5000);
