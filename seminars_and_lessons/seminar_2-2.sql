/* DML
    INSERT (ВСТАВИТЬ)
    UPDATE (ОБНОВИТЬ)
    SELECT (ПРОЧИТАТЬ)
    DELETE (УДАЛИТЬ)
 */


INSERT INTO users (id, first_name, last_name, email, phone)
    VALUES
        (1, 'Andrey', 'Naumov', 'naumov.a.n@mail.ru', '+79050845321');

INSERT INTO users (first_name, last_name, email, phone)
    VALUES
        ('Alena', 'Naumova', 'naumova-88@mail.ru', '+7132150493');


SELECT id, first_name, last_name, email, phone FROM users;
SELECT * FROM users;

