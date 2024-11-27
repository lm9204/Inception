CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';

CREATE USER 'admin_user'@'%' IDENTIFIED BY 'admin_password';
GRANT ALL PRIVILEGES ON *.* TO 'admin_user'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
