FROM	debian:bullseye

RUN	apt-get update \
	&& apt-get install -y mariadb-server \
		mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

COPY tools/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY conf/mysqld.conf /etc/mysql/mariadb.conf.d/mysqld.cnf

RUN mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql && \
	chmod -R 755 /var/lib/mysql


RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

EXPOSE 3306

CMD ["mariadbd", "-u", "root"]