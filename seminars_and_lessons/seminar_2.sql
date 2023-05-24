/* DDL
   CREATE (Создать)
   ALTER (Изменить)
   DROP (Удалить)
 */

CREATE DATABASE IF NOT EXISTS social_network;
USE social_network;

CREATE TABLE IF NOT EXISTS users(
    id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,    #тип целочисленный и только положительный, обяхательно заполняемый, сурогатный ключ, автозаполняемый
    first_name VARCHAR(255) NOT NULL COMMENT 'Имя',
    last_name VARCHAR(255) NOT NULL COMMENT 'Фамилия',
    email VARCHAR(255) NOT NULL UNIQUE COMMENT 'Почта',
    password_hach VARCHAR(255),
    phone BIGINT UNSIGNED UNIQUE NOT NULL COMMENT 'Телефон',

    INDEX index_users_name(first_name, last_name)
)COMMENT 'Пользователи';

CREATE TABLE IF NOT EXISTS profiles (
    user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    gender CHAR(1),
    hometown VARCHAR(255),
    created_at DATETIME DEFAULT NOW() NOT NULL
);

#Внешний ключ(изменяем таблицы)
ALTER TABLE profiles ADD CONSTRAINT fk_profiles_user_id # изменить таблицу profiles добавить ограничение имя ключа
    FOREIGN KEY (user_id) REFERENCES users(id); # и определение от куда и куда, т.е. user_id из таблицы profiles куда - users поле id

#Добавить колонку дата рождения в таблицу profiles
ALTER TABLE profiles ADD COLUMN birthday DATETIME;

#Изменить таблицу profiles, поменять тип данных у колонки birthday
ALTER TABLE profiles MODIFY COLUMN birthday DATE;

#Изменить имя колонки birthday
ALTER TABLE profiles RENAME COLUMN birthday TO date_of_birth;

#Удалить колонку
#ALTER TABLE profiles DROP COLUMN date_of_birth;

DESC profiles;
DESC users;

CREATE TABLE IF NOT EXISTS messages(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);


#  DROP DATABASE IF EXISTS social_network;
#  DROP TABLE IF EXISTS users;
#  DROP TABLE IF EXISTS profiles;
