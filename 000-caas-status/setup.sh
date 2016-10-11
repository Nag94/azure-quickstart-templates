#!/bin/bash

c=0
until docker info
do
  echo "Docker engine is not yet available"
  sleep 60
  let c=${c}+1
  if [ "${c}" -gt 9 ]; then
    log "Timeout on docker engine after 10 mn"
    exit 1
  fi
done

docker exec -it compose_cachet_1  php artisan key:generate
docker exec -it compose_cachet_1  php artisan app:install
docker exec -it compose_cachet_1  php artisan config:cache