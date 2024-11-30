FROM	debian:bullseye

RUN		apt-get update \
		&&	apt-get install -y nginx \
			openssl

RUN 	mkdir /etc/nginx/ssl && \
		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out	/etc/nginx/ssl/yeondcho.crt \
		-keyout	/etc/nginx/ssl/yeondcho.key \
		-subj	"/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=42Seoul/CN=yeondcho"

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN		mkdir -p /run/nginx && \
		chown -R www-data:www-data /var/www/html && \
		chmod -R 755 /var/www/html



EXPOSE	443

CMD [ "nginx", "-g", "daemon off;"]
