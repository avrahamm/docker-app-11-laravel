"Docker for PHP Developers" by Paul Redmond. </br>
Trying to solve Xdebug and other issues. </br>


Steps to build </br>

1)  Clone</br>
git clone https://github.com/avrahamm/docker-app-11-laravel.git xdebug </br>
cd xdebug </br>

2)  Add .env from .env.example and .docker.env from docker.env.example files from respective example files</br>

3) Build and run utility temporary container to composer install </br>
docker-compose build composer </br>
 docker-compose run --rm composer install </br>
 
 4) Build and run app container </br>
docker-compose build app </br>
docker-compose run app php artisan key:generate </br>
docker-compose up </br>

5) Open http://localhost:8080 in Firefox - I ran on ubuntu 20. </br>
6) Get into container bash </br>
   docker-compose exec app bash </br>

7) To see log </br>
cat /usr/local/etc/php/conf.d/xdebug.ini </br>

8) To see xdebug.ini </br>
  tail /tmp/xdebug.log </br>

