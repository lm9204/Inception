#!/bin/bash

set -e

if [ ! -f ./wp-config.php ]
then
	curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
	tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1

	# import env variables in config file
	sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	# wp-cli settings
	wp core install \
	--allow-root \
	--path="/var/www/html" \
	--url=$WORDPRESS_URL \
	--title="inception" \
	--admin_user=$WORDPRESS_ADMIN_USER \
	--admin_password=$WORDPRESS_ADMIN_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL \

	wp user create \
	$WORDPRESS_USER $WORDPRESS_USER_EMAIL \
	--user_pass=$WORDPRESS_USER_PASSWORD \
	--role=author \
	--allow-root \
	--path=/var/www/html \

	echo "워드프레스 설정 완료."
else
	echo "워드프레스 설정되어 있음."
fi

exec "$@"
