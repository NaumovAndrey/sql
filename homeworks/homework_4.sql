USE vk;

# Подсчитать количество групп (сообществ), в которые вступил каждый пользователь.
SELECT
    CONCAT(firstname, ' ', lastname) AS owner,
	count(*)
FROM users
JOIN users_communities ON users_communities.user_id = users.id
GROUP BY users.id
ORDER BY count(*) desc;

# Подсчитать количество пользователей в каждом сообществе.
DESC communities;
SELECT * FROM communities;

SELECT
    name,
    COUNT(communities.name) AS count
FROM users_communities
JOIN communities ON users_communities.community_id = communities.id
GROUP BY communities.id;

# Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).
SELECT
    from_user_id,
    COUNT(*) AS messages_sent
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY count(*) DESC
LIMIT 1;

select
	from_user_id
	, concat(u.firstname, ' ', u.lastname) as name
	, count(*) as 'messages count'
from messages m
join users u on u.id = m.from_user_id
where to_user_id = 1
group by from_user_id
order by count(*) desc
limit 1;



# * Подсчитать общее количество лайков, которые получили пользователи младше 18 лет..
SELECT count(likes.id) AS count_likes
FROM likes
JOIN media on likes.media_id = media.id
JOIN profiles p on p.user_id = media.user_id
WHERE YEAR(CURDATE()) - YEAR(birthday) < 18;

# * Определить кто больше поставил лайков (всего): мужчины или женщины.
SELECT * FROM profiles;

SELECT gender FROM (
	SELECT gender, COUNT((SELECT COUNT(*) FROM likes as L where L.user_id = P.user_id)) as gender_likes_count FROM profiles as P
	WHERE gender = 'm'
	GROUP BY gender
	UNION ALL
	SELECT gender, COUNT((SELECT COUNT(*) FROM likes as L where L.user_id = P.user_id)) FROM profiles as P
	WHERE gender = 'f'
	GROUP BY gender
) AS T
GROUP BY gender
ORDER BY MAX(gender_likes_count) DESC
LIMIT 1;

