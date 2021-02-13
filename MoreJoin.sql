--More JOIN operations

--1

SELECT id, title
 FROM movie
 WHERE yr=1962;

--2

SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

--3

SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%';

--4

SELECT id
FROM actor
WHERE name = 'Glenn Close';

--5

SELECT id
FROM movie
WHERE title = 'Casablanca';

--6

SELECT name
FROM casting JOIN actor ON actorid=actor.id
WHERE movieid = 27
GROUP BY name;

--7

SELECT name
FROM casting JOIN actor ON actorid=actor.id
WHERE movieid = 35
GROUP BY name;

--8

SELECT title
FROM casting JOIN movie ON movieid=movie.id 
             JOIN actor ON actorid=actor.id
WHERE name = 'Harrison Ford'
GROUP BY title;

--9

SELECT title
FROM movie JOIN casting ON movieid=movie.id 
             JOIN actor ON actor.id=actorid
WHERE name = 'Harrison Ford' AND ord >=2
GROUP BY title;

--10

SELECT title, name
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor ON actorid=actor.id
WHERE yr = 1962 AND ord = 1

--11

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 1

--12

SELECT title, name
 FROM movie JOIN casting ON movieid = movie.id
            JOIN actor ON actorid = actor.id         
 WHERE ord = 1 AND movie.id IN(
SELECT movieid FROM casting
 WHERE actorid IN(
SELECT id FROM actor
 WHERE name='Julie Andrews'));

--13

SELECT name
FROM actor JOIN casting ON (actor.id = actorid AND
(SELECT COUNT(ord) FROM casting WHERE actorid = actor.id 
 AND ord=1) >= 15)
 GROUP BY name;

--14

SELECT title, COUNT(actorid) AS NumActors
FROM movie JOIN casting ON movie.id = movieid 
WHERE yr = 1978
GROUP BY title
ORDER BY NumActors DESC, title;

--15

SELECT name
FROM actor JOIN casting ON actor.id = actorid 
WHERE movieid IN(SELECT movieid 
      FROM casting JOIN actor ON (actorid=id AND name = 'Art Garfunkel')) 
      AND name != 'Art Garfunkel';