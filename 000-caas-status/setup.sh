#!/bin/bash

docker exec -it compose_cachet_1  php artisan key:generate
docker exec -it compose_cachet_1  php artisan app:install
docker exec -it compose_cachet_1  php artisan config:cache