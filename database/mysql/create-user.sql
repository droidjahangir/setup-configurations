CREATE USER 'prod-npf'@'localhost' IDENTIFIED BY 'N#was|mnT';
CREATE DATABASE IF NOT EXISTS db_crc DEFAULT CHARACTER SET = 'utf8' DEFAULT COLLATE 'utf8_general_ci';
GRANT ALL PRIVILEGES ON db_crc.* TO prod-npf@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES;


