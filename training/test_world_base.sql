USE world;

SELECT * FROM city;

SELECT * FROM country;

DESC city;


#уникальность distinct
SELECT DISTINCT Continent AS Континенты, Population AS Население
FROM country;

#Выборка в таблице country по двум колонкам Continent и Population с лимитом записи в 15 строк
SELECT DISTINCT Continent AS Континенты, Population AS Население
FROM country
LIMIT 15;

SELECT DISTINCT Code, Continent AS Континенты, Population AS Население
FROM country
WHERE Code = 'RUS';

SELECT Code, LEFT(Name, 15), Population
FROM country
WHERE SurfaceArea
    BETWEEN 1000000 AND 4000000;

# Выборка в таблице city в колонке name окончание на ul (like - поиск)
SELECT Name, Population
FROM city
WHERE  Name LIKE 'novo%';

# Информация о населении
SELECT Name, Population
FROM city
WHERE Name IN ('Moscow', 'Novosibirsk', 'Barnaul');

#Сортировка по name.
SELECT Name, Population
FROM city
ORDER BY Name
LIMIT 20;

# Сортировка с конца столбца desc.
SELECT Name, Population
FROM city
ORDER BY Name DESC
LIMIT 20;

# Сортировка random
SELECT Name, Population
FROM city
ORDER BY rand()
LIMIT 20;

