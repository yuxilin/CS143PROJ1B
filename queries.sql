-- Finds the name of all Actors in the movie Die Another Day --
SELECT A.first, A.last
FROM Actor A, MovieActor MA, Movie M
WHERE M.id = MA.mid AND MA.aid = A.id AND M.title = 'Die Another Day'

-- Returns the count of all actors who acted in multiple movies --
SELECT COUNT(DISTINCT aid)
FROM MovieActor
WHERE
GROUP BY aid
HAVING COUNT(*)>=2
