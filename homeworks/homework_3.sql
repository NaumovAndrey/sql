USE vk;

# Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
SELECT DISTINCT firstname
FROM users
ORDER BY firstname;

# Выведите количество мужчин старше 35 лет [COUNT].
DESC profiles;

SELECT COUNT(birthday)
FROM profiles
WHERE (birthday + INTERVAL 35 YEAR ) <  NOW();

# Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
DESC friend_requests;

SELECT status, COUNT(status)
FROM friend_requests
GROUP BY status;

# * Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
DESC friend_requests;

SELECT * FROM friend_requests;

SELECT initiator_user_id, COUNT(*) AS request
FROM friend_requests
GROUP BY initiator_user_id
ORDER BY request DESC
LIMIT 1;

# * Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE].
/* задание не понял, это псевдореализация (допустим есть таблица group_members и я вывожу поля name_group_id, name_group
имена которых состоят из 5 символов  */
SELECT name_group_id, name_group
FROM group_members
WHERE name_group LIKE '_____';