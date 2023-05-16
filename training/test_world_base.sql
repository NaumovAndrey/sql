SELECT * FROM city;

DESC city;

SELECT DISTINCT Continent AS Континенты, Population AS Население
FROM country;

#Выборка в таблице country по двум колонкам Continent и Population с лимитом записи в 15 строк
SELECT DISTINCT Continent AS Континенты, Population AS Население
FROM country
LIMIT 15;

SELECT DISTINCT Code, Continent AS Континенты, Population AS Население
FROM country
WHERE Code = 'RUS'