FROM php:5.6-fpm-alpine

# RUN apk add php \
#     php-json \
#     php-phar \
#     php-mbstring \
#     php-openssl \
#     php-pdo \
#     php-dom \
#     php-simplexml \
RUN apk add git \
    curl

RUN docker-php-ext-install pdo_mysql && docker-php-ext-enable pdo_mysql

RUN mkdir -p /app && cd /app
COPY . /app

WORKDIR /app

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /app
# RUN php /app/composer.phar create-project --keep-vcs -s dev asherkin/throttle
RUN php /app/composer.phar install
# RUN php /app/app/console.php migrations:migrate
