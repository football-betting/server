#!/usr/bin/env bash

PUID=${UID} docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d --build || exit ${?}

for i in {1..5}
do
   echo Trying to initialize API service. Attemp ${i}/5
   docker-compose exec -T php-fpm bash -c "cd /data-api && bash init.sh" && break || sleep 10
done

docker-compose exec -T php-fpm bash -c "cd /data-tips && composer install -o" && \
docker-compose exec -T php-fpm bash -c "cd /data-match-api && composer install -o" && \
docker-compose exec -T php-fpm bash -c "cd /data-frontend && composer install -o" && \
docker-compose exec -T php-fpm bash -c "cd /data-match && composer install -o"
