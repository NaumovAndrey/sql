USE vk;

SELECT * FROM users WHERE id = 1;

SELECT * FROM media_types;

SELECT * FROM media WHERE user_id = 1 AND media_type_id = 1;

SELECT * FROM media WHERE user_id = 1 AND (filename LIKE '%.mp4' OR filename LIKE '%.avi');

-- Агрегирующие функции (AVG, MAX, MIN, COUNT, SUM):

-- Подсчитываем количество фотографий пользователя
SELECT COUNT(*) FROM media WHERE user_id = 1 AND media_type_id = 1;

-- Количество новостей каждого типа
SELECT media_type_id, COUNT(*) FROM media GROUP BY media_type_id;

-- Сколько новостей у каждого пользователя
SELECT user_id, COUNT(*) FROM media GROUP BY user_id;

-- Сколько новостей у каждого пользователя, вывести самых активных (более 1), по убыванию
SELECT user_id, COUNT(*) AS r FROM media GROUP BY user_id HAVING r > 1 ORDER BY r DESC;

-- Выбираем друзей пользователя
SELECT initiator_user_id FROM friend_requests WHERE target_user_id = 1 AND status = 'approved'
    UNION
        SELECT target_user_id FROM friend_requests WHERE initiator_user_id = 1 AND status = 'approved';

-- Выбираем новости друзей по убыванию по дате
SELECT * FROM media WHERE user_id IN (3, 4, 10) ORDER BY created_at DESC;

-- Диалог между user_id = 1 и user_id = 2 с фильтрацией по убыванию по дате
SELECT * FROM messages WHERE from_user_id = 1 AND to_user_id = 2 OR from_user_id = 2 AND to_user_id = 1 ORDER BY created_at DESC;

-- статус прочтения сообщения
ALTER TABLE messages ADD is_read BIT DEFAULT FALSE;

SELECT * FROM messages WHERE to_user_id = 1 AND is_read = TRUE;

UPDATE messages SET is_read = TRUE WHERE to_user_id = 1 AND from_user_id = 8;

-- Уникальные фамилии
SELECT DISTINCT lastname FROM users;

-- Уникальные фамилии (количество)
SELECT COUNT(DISTINCT(lastname)) FROM users;