FROM php:7.4-fpm
# فایل کامپوزر رو توی ورکینگ دایرکتوری قرار میدیم
#COPY composer.lock composer.json /var/www/

# توی این قسمت ورکینگ دایرکتوری خودمون رو مشخص میکنیم
#WORKDIR /location
WORKDIR "/application"


# هر دیپندنسی که لازم داریم رو نصب میکنیم
RUN apt-get update --fix-missing && apt-get install -y  \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlibc \
    mariadb-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    zip

RUN docker-php-ext-install opcache  && docker-php-ext-enable opcache

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000

CMD ["php-fpm"]
