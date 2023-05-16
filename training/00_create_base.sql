#   Создать базу данных
CREATE DATABASE MySampleDatabase;

#   Создать табдицу с полями
CREATE TABLE ToyStore (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    weight INTEGER NOT NULL
) AUTO_INCREMENT = 1;

#   Показать таблицу
SELECT * FROM ToyStore;

#   Показать таблицы в текущей базе данных
SHOW TABLES;

#   Подключение к базе данных
USE MySampleDatabase;

