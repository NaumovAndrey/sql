USE vk;
SHOW TABLES;

#Создайте представление с произвольным SELECT-запросом из прошлых уроков [CREATE VIEW]
-- Выборка данных по пользователю
CREATE VIEW Select_data_by_usage AS
    SELECT
        firstname,
        lastname,
        profiles.hometown AS city,
        filename AS main_photo
    FROM users
    JOIN profiles ON profiles.user_id = users.id
    JOIN media ON media.user_id = profiles.photo_id
    where users.id = 1;

# Выведите данные, используя написанное представление [SELECT]
SELECT * FROM Select_data_by_Usage;

# Удалите представление [DROP VIEW]
DROP VIEW Select_data_by_Usage;

# * Сколько новостей (записей в таблице media) у каждого пользователя? Вывести поля: news_count (количество новостей),
# user_id (номер пользователя), user_email (email пользователя). Попробовать решить с помощью CTE или с помощью обычного JOIN.
SELECT * FROM media;
DESC media;
DESC users;

SELECT user_id, COUNT(*) FROM media JOIN users ON users.id = media.user_id GROUP BY user_id;

-- после семинара (CTE)
WITH cte AS (
    SELECT
        user_id,
        COUNT(*) AS cnt
    FROM media
        JOIN users
            ON users.id = media.user_id
    GROUP BY user_id)
SELECT
    cnt,
    user_id,
    email
FROM cte
    JOIN users
        ON users.id = cte.user_id;