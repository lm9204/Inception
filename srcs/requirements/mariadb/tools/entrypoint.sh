#!/bin/sh
set -e

if [ ! -e "/var/lib/mysql/mysql" ];
then
    echo 'MariaDB 데이터 디렉토리 초기화...'
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    echo '초기화 완료.'

    mariadbd --user=root --bootstrap << EOSQL
        FLUSH PRIVILEGES;
        DELETE FROM mysql.user WHERE user='';
        CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
        CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
        GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
EOSQL

	echo 'MariaDB 설치됨.'
else
	echo 'MariaDB됨 설치되어 있음.'
fi

exec $@