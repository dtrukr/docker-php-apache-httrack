FROM php:5-apache

RUN apt-get update && \
    apt-get install -y --force-yes httrack && \
    apt-get install -y --force-yes rsync

COPY ./php.ini /usr/local/etc/php/

RUN a2enmod rewrite

RUN apt-get -y update \
    && apt-get install -y libicu-dev

# Install PHP extensions
RUN docker-php-ext-install intl
RUN docker-php-ext-install mysql
RUN docker-php-ext-install mysqli
# RUN docker-php-ext-install pdo
# RUN docker-php-ext-install pdo_mysql