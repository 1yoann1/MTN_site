# Utiliser l'image PHP officielle avec Apache
FROM php:8.0-apache

# Installer les extensions nécessaires (ajuste selon tes besoins)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copier le code source dans le conteneur
COPY . /var/www/html/

# Exposer le port 80
EXPOSE 80