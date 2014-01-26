-- Finds the name of all Actors in the movie Die Another Day --
SELECT A.first, A.last
FROM Actor A, MovieActor MA, Movie M
WHERE M.id = MA.mid AND MA.aid = A.id AND M.title = 'Die Another Day';

-- Finds the name of all the movies Pierce Brosnan played in --
SELECT title
FROM Actor A, MovieActor MA, Movie M
WHERE A.first = 'Pierce' AND A.last = 'Brosnan' AND MA.aid = A.id AND M.id = MA.mid;

-- Returns the count of all actors who acted in multiple movies --
SELECT COUNT(*) FROM
(SELECT aid FROM MovieActor
GROUP BY aid
HAVING COUNT(aid)>1) AS SQ;

