#Работаю через datagrip, тренируюсь через простое написание запроса, а не графического интерфейса.


CREATE DATABASE hwgb;

USE hwgb;

CREATE TABLE cell_phones (
    product_name VARCHAR(255) NOT NULL,
    manufacturer ENUM('Apple','Samsung','Xiaomi','HONOR', 'HUAWEI', 'OPPO', 'Vivo', 'Realme', 'Nokia', 'ZTE') NOT NULL,
    product_count INT NOT NULL,
    price DECIMAL(8, 2)
);

INSERT INTO cell_phones
VALUES
    ('Apple iPhone 12 Pro Max', 'Apple', 2, 105490),
    ('Apple iPhone SE', 'Apple', 8, 32395),
    ('Samsung Galaxy S21 Plus', 'Samsung', 2, 84990),
    ('Samsung Galaxy A32', 'Samsung', 12, 12990),
    ('Samsung M515 Galaxy M51 6', 'Samsung', 6, 31990),
    ('Xiaomi Mi 10T Pro', 'Xiaomi', 5, 14990),
    ('Xiaomi Redmi Note 9 Pro', 'Xiaomi', 3, 10990),
    ('HONOR 30 Pro plus', 'HONOR', 13, 21990),
    ('HONOR 20', 'HONOR', 6, 16990),
    ('HONOR 9C 4', 'HONOR', 5, 6290),
    ('HUAWEI Y5p', 'HUAWEI', 5, 7999),
    ('HUAWEI P Smart 2021', 'HUAWEI', 6, 15000),
    ('OPPO Reno4 Pro', 'OPPO', 5, 51990),
    ('OPPO Reno4 Lite', 'OPPO', 8, 23299),
    ('Realme 6 Pro', 'Realme', 5, 15000),
    ('Nokia 8.3', 'Nokia', 5, 29990),
    ('ZTE Blade 20 Smart', 'ZTE', 8, 5490);

SELECT * FROM cell_phones;

DESC cell_phones;

SELECT *
FROM cell_phones
WHERE product_count > 2;

SELECT *
FROM cell_phones
WHERE manufacturer='Samsung';

SELECT *
FROM cell_phones
WHERE product_name
    LIKE '%iPhone%';

SELECT *
FROM cell_phones
WHERE product_name
    LIKE '%sam%';

SELECT *
FROM cell_phones
WHERE product_name
    REGEXP '[0-9]';

SELECT *
FROM cell_phones
WHERE product_name
    LIKE '%8%';
