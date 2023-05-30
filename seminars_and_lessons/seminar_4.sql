USE vk;

-- ВЛОЖЕННЫЕ ЗАПРОСЫ
-- -------------------------------------------------------------
-- Выборка данных по пользователю
SELECT
    firstname,
    lastname,
    (SELECT hometown FROM profiles WHERE user_id = users.id) AS city,
    (SELECT filename FROM media WHERE id = (
        SELECT photo_id FROM profiles WHERE user_id = users.id
        )) AS main_photo
FROM users
WHERE id = 25;
-- --------------------------------------------------------------
-- есть запрос:
SELECT * FROM media WHERE user_id = 1 AND media_type_id = 1;
-- допустим мы знаем только e-mail
SELECT * FROM media WHERE user_id =
                          (SELECT id FROM users WHERE email = 'arlo50@example.org')
    AND media_type_id = 1;
-- --------------------------------------------------------------

-- Количество новостей каждого типа
SELECT media_type_id, COUNT(*) FROM media GROUP BY media_type_id;
-- так более информативно
SELECT
    media_type_id,
    COUNT(*),
    (SELECT name FROM media_types WHERE id = media_type_id) AS type
FROM media
GROUP BY media_type_id;
-- ------------------------------------------------

-- JOIN

-- --------------------------------
-- CROSS JOIN (медленный):
SELECT * FROM users;

SELECT * FROM users JOIN messages WHERE users.id = messages.from_user_id; -- Пользователь и его сообщение

-- INNER JOIN
SELECT * FROM users JOIN messages ON users.id = messages.from_user_id; -- Пользователь и его сообщение

-- LEFT JOIN
SELECT users.* FROM users LEFT JOIN messages ON users.id = messages.from_user_id WHERE messages.id IS NULL ORDER BY messages.id; -- Пользователь и его сообщение, которые не писали

-- RIGHT JOIN
SELECT users.*, messages.* FROM messages RIGHT JOIN users ON users.id = messages.from_user_id ORDER BY messages.id;

-- FULL JOIN
SELECT users.*, messages.* FROM users  LEFT JOIN messages ON users.id = messages.from_user_id
                           UNION DISTINCT SELECT users.*, messages.* FROM users  RIGHT JOIN messages ON users.id = messages.from_user_id;

-- Выборка данных по пользователю
SELECT
    firstname,
    lastname,
    profiles.hometown AS city,
    filename AS main_photo
FROM users
JOIN profiles ON profiles.user_id = users.id
JOIN media ON media.user_id = profiles.photo_id
where users.id = 1;
