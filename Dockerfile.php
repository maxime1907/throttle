FROM php:7.4-fpm-alpine

RUN apk add gcc make autoconf libc-dev php-pear php7-dev
RUN pecl install apcu_bc
RUN ls /etc/
RUN echo extension=apc.so > /etc/php7/conf.d/z_apc.ini
RUN echo extension=apcu.so > /usr/local/etc/php/conf.d/20-php-ext-apcu.ini

RUN apk add git \
    curl

RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql
