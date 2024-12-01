FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php-fpm \
    php-mysqli \
    php-phar \
    php-mbstring \
    curl \
    tar \
    tini && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /run/php && \
    mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]
