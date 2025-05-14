FROM php:8.3-apache

ARG APACHE_VHOST
ARG PORT

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version
    
EXPOSE ${PORT}

RUN apt-get update -qq && \
    apt-get install -qy \
    git \
    gnupg \
    unzip \
    zip \
    nodejs \
    && apt-get clean -y


RUN docker-php-ext-install -j$(nproc) opcache pdo_mysql
COPY ./docker/apache2/httpd-vhosts.${APACHE_VHOST}.conf /etc/apache2/sites-available/000-default.conf
COPY ./videgrenier/ /etc/apache2/App/VideGrenier/

RUN chown -R www-data:www-data /etc/apache2/App/VideGrenier/public
RUN chmod -R 755 /etc/apache2/App/VideGrenier/public

WORKDIR /etc/apache2/App/VideGrenier/
RUN a2enmod rewrite
RUN composer install
COPY .env /etc/apache2/App/VideGrenier/.env

# RUN npm install
# RUN npm run watch



