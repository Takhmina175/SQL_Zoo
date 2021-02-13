--SELECT within SELECT Tutorial

--1

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

--2

SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population >(
SELECT gdp/population FROM world WHERE name = 'United Kingdom');

--3
SELECT name, continent
FROM world
WHERE continent IN(SELECT continent FROM world WHERE name IN ('Argentina', 'Australia')) ORDER BY name;

--4

SELECT name, population
FROM world
WHERE population >(SELECT population FROM world WHERE name = 'Canada') AND
      population <(SELECT population FROM world WHERE name = 'Poland');

--5

SELECT name, 
CONCAT(ROUND(100*population/(SELECT population FROM world WHERE name = 'Germany'), 0),'%')
FROM world
WHERE continent ='Europe';

--6

SELECT name FROM world
 WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

--7

SELECT continent, name, area FROM world x
  WHERE x.area >= ALL
    (SELECT y.area FROM world y
        WHERE y.continent=x.continent AND area > 0);

--8

SELECT x.continent, x.name
FROM world x
WHERE x.name <= ALL(SELECT y.name FROM world y WHERE y.continent = x.continent)
ORDER BY name; 

--9

SELECT name, continent, population
FROM world x
WHERE 25000000 > ALL (SELECT population FROM world y 
WHERE y.continent = x.continent AND y.population>0);

--10

SELECT name, continent
FROM world x
WHERE population > ALL (SELECT population*3 FROM world y 
WHERE y.continent = x.continent AND y.name != x.name AND population >0);
