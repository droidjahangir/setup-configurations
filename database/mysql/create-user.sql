CREATE USER 'jcc_user'@'localhost' IDENTIFIED BY 'N#was|mnT';
CREATE DATABASE IF NOT EXISTS ems_web_jcc DEFAULT CHARACTER SET = 'utf8' DEFAULT COLLATE 'utf8_general_ci';
GRANT ALL PRIVILEGES ON ems_web_jcc.* TO jcc_user@localhost WITH GRANT OPTION;
FLUSH PRIVILEGES;


-- enable readonly mode in mysql database
