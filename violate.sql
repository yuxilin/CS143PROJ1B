-- PRIMARY KEY VIOLATIONS --
-- Inserts a movie id that is supposed to be distinct since the primary key is the movie ID--
-- ERROR 1062 (23000): Duplicate entry '2' for key 1 --
INSERT INTO Movie VALUES(2, '10 Things I Hate About You', 1999, 'PG-13', 'Lakeshore Enterntainment');

-- Inserts a director id that is supposed to be distinct since the primary key is the director ID --
-- ERROR 1062 (23000): Duplicate entry '16' for key 1 --
INSERT INTO Movie VALUES(16, 'Joseph', 'Arun', 1960-07-15, NULL);

-- Inserts a Movie ID that does not exist into MovieGenre which uses mid as a Foreign Key which references Movie id --
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143/MovieGenre`, CONSTRAINT `MovieGenre_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`)) --
INSERT INTO MovieGenre (mid) VALUES(1);

-- Inserts a Director id that does not exist into Movie Director which uses did as a Foreign Key which references Director id --
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143/MovieDirector`, CONSTRAINT `MovieDirector_ibfk_2` FOREIGN KEY (`did`) REFERENCES `Director` (`id`)) --
INSERT INTO MovieDirector (did) VALUES(15);

-- Inserts an Actor id that does not exist into MovieActor which uses aid as a Foreign Key which references Actor id --
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143/MovieActor`, CONSTRAINT `MovieActor_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `Actor` (`id`)) --
INSERT INTO MovieActor (aid) VALUES(9);

-- Inserts a Movie id that does not exist into Review which uses mid as a Foreign Key which references Movie id --
-- ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`CS143/Review`, CONSTRAINT `Review_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `Movie` (`id`)) --
INSERT INTO Review (mid) VALUES(1);

-- VIOLATES CHECK Inserts an id that is greater than the maximum person id value of 6900 --
INSERT INTO Actor (id,dob) VALUES(69001, 1986-03-05);

-- VIOLATES CHECK Inserts an id that is greater than the maximum person id value of 6900 --
INSERT INTO Director(id, dob) VALUES(69002, 1986-03-05);
