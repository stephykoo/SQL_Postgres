#What languages are spoken in the United States? (12) Brazil? (not Spanish...) Switzerland? (6)
```
SELECT
	c.name AS country,
	cl.language AS language
FROM
	country c JOIN
    countrylanguage cl ON c.code = cl.countrycode
WHERE
	c.code= 'USA'
ORDER BY
	language
```
Brazil= 5

#What are the cities of the US? (274) India? (341)
```
SELECT
	c.name,
    cy.countrycode,
    cy.name
FROM
	country c JOIN
    city cy ON c.code = cy.countrycode
WHERE
	countrycode= 'USA'
ORDER BY
	cy.name
```
```
SELECT
	c.name,
    cy.countrycode,
    cy.name
FROM
	country c JOIN
    city cy ON c.code = cy.countrycode
WHERE
	countrycode= 'IND'
ORDER BY
	cy.name
```

#What are the official languages of Switzerland? (4 languages)
```
SELECT
	c.name,
    cl.language,
    cl.isofficial
FROM
	country c JOIN
    countrylanguage cl ON (cl.countrycode = c.code)
WHERE
	countrycode= 'CHE'
```
German, French, Italian, Romansh


#Which country or countries speak the most languages? (12 languages)
#Hint: Use GROUP BY and COUNT(...)
```
SELECT
	COUNT(language),
    countrycode
FROM
	countrylanguage
GROUP BY
	countrycode
ORDER BY
	COUNT(language) DESC LIMIT 12
```


#Which country or countries have the most official languages? (4 languages)

```
SELECT
	COUNT(language),
    countrycode,
    isofficial
FROM
	countrylanguage

GROUP BY
	countrycode,
     isofficial
ORDER BY
	NOT isofficial,
	COUNT(language) DESC
```
ZAF, CHE

#Which languages are spoken in the ten largest (area) countries?

```
WITH
	big_countries AS
    (SELECT *
    from country
    where population != 0
    order by surfacearea desc
    limit 12)
SELECT
	bc.name,
    cl.language
FROM
	big_countries bc JOIN
    countrylanguage cl ON (bc.code = cl.countrycode)
GROUP BY
	cl.countrycode,
    bc.name,
    bc.surfacearea,
    cl.language
ORDER BY
	bc.surfacearea DESC
```
#What languages are spoken in the 20 poorest (GNP/ capita) countries in the world? (94 with GNP > 0)
#Hint: Use WITH to get the countries, and SELECT DISTINCT to remove duplicates
```
WITH
	poorest AS
	(select *
    from country
    where population != 0
    order by gnp/population asc
    limit 20)
SELECT DISTINCT
    cl.language
FROM
	poorest p JOIN
    countrylanguage cl ON (p.code = cl.countrycode)
GROUP BY
    cl.language
ORDER BY
	cl.language desc
```

#Are there any countries without an official language?
#Hint: Use NOT IN with a SELECT

```
WITH offtrue AS
	(SELECT
    	*
    FROM
    	countrylanguage
    WHERE
    	isofficial = 'true')
SELECT
	of.countrycode
FROM
	offtrue of JOIN
	countrylanguage cl ON (cl.isofficial = of.isofficial)
WHERE
	of.countrycode NOT IN (cl.countrycode)
GROUP BY
	of.countrycode,
    cl.countrycode,
    cl.language
```

#What are the languages spoken in the countries with no official #language? (49 countries, 172 languages, incl. English)
```
WITH offtrue AS
(SELECT
    	*
    FROM
    	countrylanguage
    WHERE
    	isofficial = 'true')
SELECT
	cl.countrycode,
    off.isofficial
FROM
	offtrue off RIGHT OUTER JOIN
    countrylanguage cl ON cl.isofficial = off.isofficial
WHERE
	off.isofficial IS NULL
GROUP BY
	cl.countrycode,
    off.isofficial
ORDER BY
	off.isofficial
```
```
WITH official_lang AS
(SELECT
 	language, isofficial, countrycode
FROM
 	countrylanguage
WHERE
 	isofficial = 'true')

SELECT
	code, name, language, isofficial
FROM
	country c LEFT OUTER JOIN
	official_lang ol ON (c.code = ol.countrycode)
WHERE
	ol.countrycode IS NULL

``` 




#Which countries have the highest proportion of official language speakers? The lowest?





#What is the most spoken language in the world?
```
SELECT
	COUNT(countrycode),
    language
FROM
	countrylanguage
GROUP BY
	language
ORDER BY
	COUNT(countrycode)
```
English
