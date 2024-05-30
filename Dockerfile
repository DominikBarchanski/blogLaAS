# Dockerfile
FROM php:8.3-fpm

# Uaktualnienie pakietów i instalacja niezbędnych zależności
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpq-dev \
    zip \
    unzip \
    && docker-php-ext-install pdo pdo_pgsql

# Instalacja Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

# Skopiowanie plików aplikacji
COPY . .

# Instalacja zależności PHP
RUN composer install

# Instalacja zależności Node.js (jeśli używane)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm install


# Ustawienia uprawnień
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Uruchomienie serwera PHP-FPM
CMD ["php-fpm"]
