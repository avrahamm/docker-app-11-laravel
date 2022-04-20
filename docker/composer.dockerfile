FROM composer:1.10.19
#https://stackoverflow.com/questions/70425457/is-there-anyway-to-use-docker-composer-image-with-custom-php
# inspired by maxm udemy course
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

USER laravel

WORKDIR /var/www/html

COPY . .

ENTRYPOINT [ "composer", "--ignore-platform-reqs" ]
