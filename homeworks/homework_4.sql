USE vk;

# Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.
SELECT
    id,
    firstname,
    lastname,
    COUNT(*),
    (SELECT name FROM communities WHERE communities.id = users.id) AS count_groups
FROM users
GROUP BY users.id;

-- Вариант 2
SELECT
    users.id,
    firstname,
    lastname,
    communities.name
FROM users
JOIN communities ON communities.id = users.id
GROUP BY users.id;

# Подсчитать количество пользователей в каждом сообществе.
DESC communities;
SELECT * FROM communities;

SELECT
    name,
    COUNT(users.id) AS count
FROM communities
JOIN users ON users.id = communities.id
GROUP BY name;

# Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
SELECT
    users.id,
    firstname,
    lastname,
    messages.body
FROM users
JOIN messages on users.id = messages.to_user_id
where users.id = 1;


SELECT
    from_user_id,
    COUNT(*) AS messages_sent
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY from_user_id DESC
LIMIT 1;



# * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..
# * Определить кто больше поставил лайков (всего): мужчины или женщины.
