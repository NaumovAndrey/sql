#    Просмотр всех баз данных
SHOW DATABASES;

#  Просмотр таблиц
SHOW TABLES;

#   Просмотр записей в таблище
SELECT * FROM contacts;

#    Добавить запсь в таблицу
INSERT INTO data_bases.contacts (id, first_name, last_name, email, phone) VALUES (3,'Наумова', 'Анна', 'naumova_aa@icloud.com', '+79627919320');
INSERT INTO data_bases.contacts (id, first_name, last_name, email, phone) VALUES (4, 'Иван', 'Иванов', 'ivan@mail.ru', '+79001234567');

#   изменить запись под индексом №3
UPDATE data_bases.contacts t SET t.first_name = 'Анна', t.last_name = 'Наумова' WHERE t.id = 3;

DESC contacts;

