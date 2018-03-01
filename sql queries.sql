-- SELECT *
-- FROM country
-- WHERE code = 'USA'
--
-- 27835700

SELECT surfacearea
FROM country
WHERE code = 'USA'

'9.36352e+06'

SELECT name
FROM country
WHERE continent = 'Africa'
AND population < 30000000
AND lifeexpectancy > 45

SELECT *
FROM country
WHERE governmentform like '%public'

SELECT *
FROM country
WHERE governmentform like '%public'
AND indepyear > 1945

SELECT *
FROM country
WHERE
not governmentform like '%public'
AND indepyear > 1945

-- lowest 15
SELECT lifeexpectancy
FROM country
ORDER BY lifeexpectancy
limit 15

--highest 15
SELECT lifeexpectancy
FROM country
WHERE lifeexpectancy is not null
ORDER BY lifeexpectancy desc
limit 15

-- lowest population country --

SELECT *
FROM country
ORDER BY population
limit 5


-- highest population country --
SELECT *
FROM country
WHERE population is not null
ORDER BY population desc
limit 5

--area and pop lowest to highest
SELECT *
FROM country
WHERE population != 0
ORDER BY surfacearea, population
limit 10

SELECT *
FROM country
WHERE population != 0
ORDER BY surfacearea desc, population desc,
limit 10


-- with operatior
WITH
	small_countries AS
    (SELECT *
    from country
    order by surfacearea
    limit 10)
select *
from small_countries
order by gnp desc


WITH
	small_countries AS
    (SELECT *
    from country
    where population != 0
    order by surfacearea
    limit 10)
select gnp/population, *
from small_countries
order by gnp desc
'Macao'


--biggest 10 countries gnp per capita --
WITH
	big_countries AS
    (SELECT *
    from country
    where population != 0
    order by surfacearea desc
    limit 10)
select gnp/population, *
from  big_countries
order by gnp/population desc

--sum of the surfacearea of the 10 biggest contries in the WERLD
WITH
	big_countries AS
    (SELECT *
    from country
    order by surfacearea desc
    limit 10)
SELECT sum(surfacearea) as "sum_of_area"
from big_countries


-- total area of the continents
SELECT continent, sum(population) as totalpop, sum(surfacearea) as size
FROM country
GROUP BY continent

--avg GNP
SELECT continent, avg(gnp) as averagegnp
FROM country
GROUP BY continent
ORDER BY averagegnp desc

--head of state with population
SELECT headofstate, sum(population)
from country
group by headofstate
order by sum(population) desc

--"" with surface
SELECT headofstate, sum(surfacearea)
from country
group by headofstate
order by sum(surfacearea) desc

-- most common forms of government using count(*)
SELECT governmentform, count(*)
from country
group by governmentform
order by count(*) desc

--top 10 by surface area usingWITH
WITH
	top_ten AS
    (select *
    from country
    order by surfacearea desc)
select governmentform
from top_ten
limit 10


--top 10 surface are
WITH
	top_ten AS
	(select *
    from country
    order by surfacearea desc
    limit 10)
select governmentform, count(governmentform)
from top_ten
group by governmentform

--richest--
WITH
	top_ten AS
	(select *
    from country
    order by gnp desc
    limit 10)
select governmentform, count(governmentform)
from top_ten
group by governmentform

--richest per capita--
WITH
	top_ten AS
	(select *
    from country
     where population !=0
    order by gnp/population desc
    limit 10)
select governmentform, count(governmentform)
from top_ten
group by governmentform

--
select (surfacearea/1.48956e+08)*100 as top5, *
from country
where (surfacearea/1.48956e+08)*100 >= 5
order by top5 desc


January 20, 2001 – January 20, 2009
2001 CHN population = 1276.27
1277558000
2002 CHN population = 1284.53

spanish


select language, count(countrycode)
from countrylanguage
group by language
order by count(countrycode)desc
limit 3

--

select count(id), countrycode
from city
where countrycode = 'CHL'
group by countrycode

29 cities

select continent, count(code)
from country
group by continent

'North America','37'

122 counties before 1963
\select *
from country
where indepyear <= 1963

world population
'6078749450'
select sum(population)
from country


select continent, round(avg(lifeexpectancy))
from country
group by continent
'Europe','75'
'Oceania','70'
'Asia','67'
'North America','73'
'Africa','53'
'Antarctica',
'South America','71'

select count(code)
from country
where name like '%z%'
13 countries

select 2018 - indepyear
from country
where code = 'JAM'
56
