FROM php:7.4-fpm-alpine

ENV COMPOSER_ALLOW_SUPERUSER 1
RUN echo "date.timezone=UTC" >> $PHP_INI_DIR/php.ini

RUN docker-php-ext-install bcmath
RUN curl -Ls https://getcomposer.org/composer.phar > /usr/local/bin/composer && chmod +x /usr/local/bin/composer
