--CONSTRAINTS: id should be unique and less than the max movie id
CREATE TABLE Movie (id INT PRIMARY KEY, title VARCHAR(100), year INT, rating VARCHAR(10), company VARCHAR(50), CHECK(id <= MaxMovieID(id))) ENGINE = INNODB;

--CONSTRAINTS: id should be unique and less than the max person id. date of birth is not null
CREATE TABLE Actor (id INT PRIMARY KEY, last VARCHAR(20), first VARCHAR(20), sex VARCHAR(6), dob DATE NOT NULL, dod DATE, CHECK(id <= MaxPersonID(id))) ENGINE = INNODB;

--CONSTRAINTS: director id should be unique in the table and less than max person id
CREATE TABLE Director (id INT PRIMARY KEY, last VARCHAR(20), first VARCHAR(20), dob DATE NOT NULL, dod DATE, CHECK(id <= MaxPersonID(id))) ENGINE = INNODB;
CREATE TABLE MovieGenre (mid INT, genre VARCHAR(20)) ENGINE = INNODB;
CREATE TABLE MovieDirector (mid INT, did INT) ENGINE = INNODB;
CREATE TABLE MovieActor (mid INT, aid INT, role VARCHAR(50)) ENGINE = INNODB;
CREATE TABLE Review (name VARCHAR(20), time TIMESTAMP, mid INT, rating INT, comment VARCHAR(500)) ENGINE = INNODB;
CREATE TABLE MaxPersonID (id INT) ENGINE = INNODB;
CREATE TABLE MaxMovieID (id INT) ENGINE = INNODB;

--CONSTRAINTS: mid needs to exist in id column of the Movie table
ALTER TABLE MovieGenre
ADD FOREIGN KEY (mid) REFERENCES Movie(id);

--CONSTRAINTS: mid needs to exist in id column of the Movie table
ALTER TABLE MovieDirector
ADD FOREIGN KEY(mid) REFERENCES Movie(id);

--CONSTRAINTS: did needs to exist in the id column of the Director table
ALTER TABLE MovieDirector
ADD FOREIGN KEY(did) REFERENCES Director(id);

--CONSTRAINTS: mid needs to exist in id column of the Movie table
ALTER TABLE MovieActor
ADD FOREIGN KEY(mid) REFERENCES Movie(id);

--CONSTRAINTS: aid needs to exist in the id column of the Actor table
ALTER TABLE MovieActor
ADD FOREIGN KEY(aid) REFERENCES Actor(id);

--CONSTRAINTS: mid needs to exist in id column of the Movie table
ALTER TABLE Review
ADD FOREIGN KEY(mid) REFERENCES Movie(id);

