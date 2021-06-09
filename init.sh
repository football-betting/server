#!/usr/bin/env bash

PUID=${UID} docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d --build || exit ${?}

echo Giving services time to boot...
sleep 10

docker-compose exec -T php-fpm bash -c "cd /data-api && bash init.sh" && \
docker-compose exec -T php-fpm bash -c "cd /data-tips && composer install -o" && \
docker-compose exec -T php-fpm bash -c "cd /data-match && composer install -o"
