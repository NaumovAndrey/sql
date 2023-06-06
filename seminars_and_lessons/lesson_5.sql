USE test_database;

-- Создание таблицы
CREATE TABLE IF NOT EXISTS staff
(
    id INT PRIMARY KEY,
    first_name VARCHAR(30),
    post VARCHAR(30),
    discipline VARCHAR(30),
    salary INT
);

-- Заполнение таблицы данными
INSERT staff (id, first_name, post, discipline, salary)
VALUES
	(100,'Антон', 'Преподаватель', 'Программирование', 50),
	(101,'Василий', 'Преподаватель', 'Программирование', 60),
	(103,'Александр', 'Ассистент', 'Программирование', 25),
	(104,'Владимир', 'Профессор', 'Математика', 120),
	(105,'Иван', 'Профессор', 'Математика', 120),
	(106,'Михаил', 'Доцент', 'Физика', 70),
	(107, 'Анна', 'Доцент', 'Физика', 70),
	(108, 'Вероника', 'Доцент', 'ИКТ', 30),
	(109,'Григорий', 'Преподаватель', 'ИКТ', 25),
	(110,'Георгий', 'Ассистент', 'Программирование', 30);

SELECT * FROM staff;
DESC staff;

-- оконные функции


SELECT id, first_name, salary,
	SUM(salary) OVER() AS 'Sum',
	COUNT(salary) OVER() AS 'Count'
FROM staff;

SELECT
    SUM(salary)  AS 'Sum',
	COUNT(salary) AS 'Count'
FROM staff;

SELECT id, first_name, post, discipline, salary,
	SUM(salary) OVER(PARTITION BY post) AS 'Sum'
FROM staff;

-- ищем сумму всех значений с предыдущими.
SELECT id, first_name, post, discipline, salary,
	SUM(salary) OVER(PARTITION BY post ORDER BY first_name) AS 'Sum'
FROM staff;

-- Cумма рассчитывается по текущей и следующей ячейке в окне. А последняя строка в окне имеет то же значение, что и столбец «сount»: больше не с чем складывать.
SELECT id, first_name, post, discipline, salary,
	SUM(salary) OVER(PARTITION BY post ORDER BY salary ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING) AS 'Sum'
FROM staff;


-- Виртуальная таблица
CREATE VIEW copy_staff AS
SELECT id, first_name, post, discipline, salary
FROM staff
WHERE post = 'Доцент';

SELECT * FROM copy_staff;

DROP VIEW copy_staff;

