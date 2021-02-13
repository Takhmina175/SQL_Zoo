








--SELF JOIN

--1
SELECT COUNT(name)
FROM stops;

--2

SELECT id
FROM stops
WHERE name = 'Craiglockhart';

--3
SELECT stops.id, stops.name
FROM stops JOIN route ON stops.id = route.stop
WHERE route.num=4 AND route.company='LRT';

--4

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)= 2;

--5

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

--6

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name = 'London Road';

--7

SELECT DISTINCT a.company, b.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop = 137;

--8

SELECT DISTINCT a.company, b.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 230;

--9

SELECT st2.name, a.company, b.num
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
             JOIN stops st1 ON (a.stop = st1.id)
             JOIN stops st2 ON (b.stop = st2.id)
WHERE st1.name = 'Craiglockhart';










