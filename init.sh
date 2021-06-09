#!/usr/bin/env bash

if [ "${1}" == "" ]; then
  PUID=${UID} docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d --build || exit ${?}
fi

for i in {1..5}
do
   echo Trying to initialize API service. Attemp ${i}/5
   docker-compose exec -T php-fpm bash -c "cd /data-api && bash init.sh" && break || sleep 10
done

docker-compose exec -T php-fpm bash -c "find / -maxdepth 1 -type d -name 'data-*' -exec composer install -o -d {} \;"
