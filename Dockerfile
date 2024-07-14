FROM php:7.4-apache

# Instalar extensiones necesarias para PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copiar la configuración de Apache
COPY ./apache-config/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copiar los archivos de la aplicación
COPY ./src /var/www/html/

# Habilitar el módulo de reescritura de Apache
RUN a2enmod rewrite

# Ajustar permisos de archivos
RUN chown -R www-data:www-data /var/www/html