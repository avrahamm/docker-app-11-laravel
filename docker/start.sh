#!/usr/bin/env bash

set -e

env=${APP_ENV:-production}

#echo "The environment is $env"

role=${CONTAINER_ROLE:-app}

echo "The role is $role"

if [ "$env" != "local" ]; then
  echo "Removing XDebug"
  rm -rf /usr/local/etc/php/conf.d/{docker-php-ext-xdebug.ini,xdebug.ini}
fi

if [ "$role" = "app" ]; then
    exec apache2-foreground
elif [ "$role" = "scheduler" ]; then
    while [ true ]
    do
        php /var/www/html/artisan schedule:run --verbose --no-interaction &
        sleep 60
    done
elif [ "$role" = "queue" ]; then
    echo "Running the queue"
    php /var/www/html/artisan queue:work --verbose --tries=3 --timeout 90

else
    echo "Could not match the container role $role"
    exit 1
fi
