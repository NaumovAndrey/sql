# 1.  Создать БД vk, исполнив скрипт _vk_db_creation.sql (в материалах к уроку)
    # hw2_base.sql
# 2.  Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)

CREATE TABLE IF NOT EXISTS call_info(
    id SERIAL,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    start_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    end_time DATETIME DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),
    FOREIGN KEY (from_user_id) REFERENCES users (id),
    FOREIGN KEY (to_user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS foto_albums (
    id SERIAL,
    Name VARCHAR(255) NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS fotos(
    id SERIAL,
    album_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (album_id) REFERENCES foto_albums (id),
    FOREIGN KEY (media_id) REFERENCES media (id)
);


# 3.  Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)

SELECT * FROM vk.users;
SELECT * FROM messages;
DESC users;
DESC messages;
SHOW CREATE TABLE users;
SHOW CREATE TABLE messages;

INSERT INTO users(firstname, lastname, email, phone)
VALUES
    ('Andrey', 'Naumov', 'naumov@icloud.com', '+79050845321'),
    ('Alena', 'Naumova', 'naumova@mail.aa', '+79130000000'),
    ('Anna', 'Naumova', 'naumova.a@mail.aa', '+79050000000'),
    ('Ivanov', 'Ivan', 'ivan@icloud.com', '+79000000001'),
    ('Petrov', 'Petr', 'petrov@icloud.com', '+79000000002'),
    ('Ivanov', 'petr', 'ivanov@icloud.com', '+79000000003');

INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (2, 1, 'This is a test message from 2 to 1', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (2, 1, 'This is a test message from 2 to 1', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (2, 1, 'This is a test message from 2 to 1', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (3, 2, 'This is a test message from 3 to 2', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (10, 3, 'This is a test message from 4 to 3', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (2, 1, 'This is a test message from 2 to 1', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (1, 2, 'This is a test message from 1 to 2', DEFAULT);
INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at) VALUES (12, 2, 'This is a test message from 2 to 4', DEFAULT);

INSERT INTO vk.messages (from_user_id, to_user_id, body, created_at)
VALUES
    (2, 1, 'This is a test message from 2 to 1', DEFAULT),
    (2, 1, 'This is a test message from 2 to 1', DEFAULT),
    (2, 1, 'This is a test message from 2 to 1', DEFAULT),
    (3, 2, 'This is a test message from 3 to 2', DEFAULT),
    (10, 3, 'This is a test message from 4 to 3', DEFAULT),
    (12, 2, 'This is a test message from 2 to 4', DEFAULT);

# 4.* Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true).
# При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE)

DESC profiles;

ALTER TABLE profiles
    ADD COLUMN is_active BOOLEAN DEFAULT true
    AFTER user_id;

SELECT * FROM profiles;

UPDATE profiles
    SET is_active = false
    WHERE (birthday + INTERVAL 18 YEAR ) >  NOW();

# после просмотра семинара
ALTER TABLE profiles
    CHANGE COLUMN is_active is_active BIT;

# 5.* Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)

SELECT * FROM messages;

DELETE FROM messages
WHERE created_at > NOW();

# после просмотра семинара
ALTER TABLE messages
ADD COLUMN is_deleted BIT DEFAULT FALSE;

UPDATE messages
    SET is_deleted = true
    WHERE created_at > NOW();