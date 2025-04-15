FROM php:8.3-apache

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

EXPOSE 8088

RUN apt-get update -qq && \
    apt-get install -qy \
    git \
    gnupg \
    unzip \
    zip \
    nodejs \
    && apt-get clean -y

RUN docker-php-ext-install -j$(nproc) opcache pdo_mysql

COPY docker/apache2/httpd-vhosts.conf /etc/apache2/sites-available/000-default.conf
COPY . /etc/apache2/App/VideGrenier/
RUN chmod -R 777 /etc/apache2/App/VideGrenier/public

WORKDIR /etc/apache2/App/VideGrenier/
RUN a2enmod rewrite
RUN composer install
# RUN npm install
# RUN npm run watch



