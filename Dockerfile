FROM phpswoole/swoole:4.6.0-php7.4-alpine
WORKDIR /var/www
RUN wget https://github.com/swoole/ext-postgresql/archive/refs/tags/v4.6.1.tar.gz \
    && tar -xvf v4.6.1.tar.gz
RUN apk update
RUN apk add autoconf build-base zlib-dev openssl-dev postgresql-dev
RUN cp /usr/include/libpq-fe.h /usr/include/postgresql/
WORKDIR /var/www/ext-postgresql-4.6.1
RUN phpize
RUN ./configure --with-openssl-dir=/usr/include/openssl
RUN make && make install
RUN docker-php-ext-enable swoole_postgresql.so
RUN pecl install redis && docker-php-ext-enable redis.so
RUN pecl install mongodb && docker-php-ext-enable mongodb.so
RUN docker-php-ext-configure pcntl --enable-pcntl \
    && docker-php-ext-install pcntl
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN echo swoole.use_shortname='Off' >> "$PHP_INI_DIR/php.ini"
WORKDIR /var/www