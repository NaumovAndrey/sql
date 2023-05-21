SHOW CREATE TABLE table1;
USE test_database;

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA
    INFILE 'E:\\mysql\\query2.txt'
    INTO TABLE table1
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n';

SELECT * FROM table1;

DESC table1;