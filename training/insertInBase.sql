CREATE DATABASE test_database;
USE test_database;

CREATE TABLE table1(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    txt VARCHAR(255) NOT NULL DEFAULT '',
    dt DATETIME,
    col4 ENUM('case_1','case_2','case_3','case_4')
);

# Параметры колонок у таблицы
DESC table1;

SELECT * FROM table1;

INSERT INTO table1 VALUES(1, 'ТЕКСТ', NOW(), 'case_1');

#Вариант добавления в таблицу №1-1
INSERT INTO table1
VALUES
    (NULL, 'ТЕКСТ2', NOW(), 'case_2'),
    (NULL, 'ТЕКСТ3', NOW(), 'case_3'),
    (NULL, 'ТЕКСТ4', NOW(), 'case_4'),
    (NULL, 'ТЕКСТ5', NOW(), 'case_1'),
    (NULL, 'ТЕКСТ6', NOW(), 'case_2'),
    (NULL, 'ТЕКСТ7', NOW(), 'case_3');

SHOW CREATE TABLE table1;

#Вариант добавления в таблицу №1-2
INSERT INTO table1(txt, dt, col4)
VALUES
    ('ТЕКСТ8', NOW(), 'case_2'),
    ('ТЕКСТ9', NOW(), 'case_3'),
    ('ТЕКСТ10', NOW(), 'case_4'),
    ('ТЕКСТ11', NOW(), 'case_1'),
    ('ТЕКСТ12', NOW(), 'case_2'),
    ('ТЕКСТ13', NOW(), 'case_3');

#Вариант добавления в таблицу №2
INSERT INTO table1
SET txt = 'ТЕКСТ14', dt=NOW(), col4='case_2';

#Вариант добавления в таблицу №3. Добавление из другой таблице.
INSERT INTO table1
SELECT NULL, USER(), NOW(),'Case_3'
FROM mysql.user;