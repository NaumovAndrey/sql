USE vk;


#Написать функцию, которая удаляет всю информацию об указанном пользователе из БД vk. Пользователь задается по id.
# Удалить нужно все сообщения, лайки, медиа записи, профиль и запись из таблицы users. Функция должна возвращать номер пользователя.
SET FOREIGN_KEY_CHECKS=0;
DELETE u, m, l, md, fr
FROM users u
    LEFT JOIN friend_requests fr ON fr.initiator_user_id and fr.target_user_id = u.id
    LEFT JOIN messages m ON u.id = m.from_user_id OR u.id = m.to_user_id
    LEFT JOIN likes l ON u.id = l.user_id
    LEFT JOIN media md ON u.id = md.user_id
WHERE u.id = 5;
SET FOREIGN_KEY_CHECKS=1;

#Предыдущую задачу решить с помощью процедуры
# и обернуть используемые команды в транзакцию внутри процедуры.
DROP PROCEDURE IF EXISTS del_user;
DELIMITER //
CREATE PROCEDURE del_user(user_id INT)
    BEGIN
        DECLARE x INT;
        SET x = user_id;

        START TRANSACTION;
            SET FOREIGN_KEY_CHECKS=0;
            DELETE u, m, l, md, fr
            FROM users u
                LEFT JOIN friend_requests fr ON fr.initiator_user_id and fr.target_user_id = u.id
                LEFT JOIN messages m ON u.id = m.from_user_id OR u.id = m.to_user_id
                LEFT JOIN likes l ON u.id = l.user_id
                LEFT JOIN media md ON u.id = md.user_id
            WHERE u.id = x;
            SET FOREIGN_KEY_CHECKS=1;
        COMMIT;
    end;
END //
DELIMITER ;

CALL del_user(11);

SELECT * FROM users;
#* Написать триггер, который проверяет новое появляющееся сообщество. Длина названия сообщества (поле name) должна быть не менее 5 символов. Если требование не выполнено, то выбрасывать исключение с пояснением.

