USE vk;

SELECT * FROM users;

-- количество новостей каждого типа (п)
SELECT
    media_type_id,
    COUNT(*)
FROM media
GROUP BY media_type_id;

-- АЛЬТЕРНАТИВНЫЙ ВАРИАНТ (ОКОННАЯ ФУНКЦИЯ)
SELECT DISTINCT # применить уникальность
    media_type_id,
    COUNT(*) OVER (PARTITION BY media_type_id) AS count # для весех media_type_id посчитать количество
FROM media;

SELECT DISTINCT
    media_type_id,
    COUNT(*) OVER W AS CNT # имя для оконной функции, а cnt это имя колонки в таблице
FROM media
WINDOW  w AS (PARTITION BY media_type_id); # определение оконной функции, т.е. обращаемся по имени оконной функции

SELECT * FROM media_types;


-- Общие табличные выражения (CTE)
-- --------------------------------------------------------------
-- вывести самых активных пользователей (более 1й записи)
SELECT COUNT(*), user_id FROM media GROUP BY user_id HAVING COUNT(*) > 1;

-- Альтернативный вариант

WITH cte_1 AS (SELECT COUNT(*), user_id FROM media GROUP BY user_id HAVING COUNT(*) > 1)
SELECT * FROM cte_1 JOIN users AS u ON u.id = cte_1.user_id;

-- 50:53 SEMINAR 5