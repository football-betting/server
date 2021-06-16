# Football betting

## Local setup
Run the following command to start the setup and initialize all services

```bash
./init.sh
```

You can access the apps now on

|App|Url|
|---|---|
|Api|http://localhost:8080|
|Frontend|http://localhost:8084|
|Rabbit MQ Admin|http://localhost:8088|
|Redis Commander|http://localhost:8089|

## Command

```
git submodule update --recursive --remote
docker-compose exec php-fpm bash
```

## CronJob

```
cd /data-match-api && php bin/console football:matches

cd /data-match/ && php bin/console messenger:consume match.api.to.match

cd /data-calculation-list && php bin/console messenger:consume match.to.calculation
cd /data-calculation-list && php bin/console messenger:consume tip.list.to.calculation

cd /data-ranking-list && php bin/console messenger:consume calculation.to.rating
cd /data-ranking-list && php bin/console messenger:consume match.to.rating

cd /data-api && php bin/console messenger:consume calculation.to.app

cd /data-tips && php bin/console messenger:consume app.to.tip
```

#### Create queues


```
cd /data-match/ && php bin/console messenger:consume match.api.to.match --no-interaction --time-limit=0.1 > /dev/null 2>&1

cd /data-calculation-list && php bin/console messenger:consume match.to.calculation --no-interaction --time-limit=0.1 > /dev/null 2>&1
cd /data-calculation-list && php bin/console messenger:consume tip.list.to.calculation --no-interaction --time-limit=0.1 > /dev/null 2>&1

cd /data-ranking-list && php bin/console messenger:consume calculation.to.rating --no-interaction --time-limit=0.1 > /dev/null 2>&1
cd /data-ranking-list && php bin/console messenger:consume match.to.rating --no-interaction --time-limit=0.1 > /dev/null 2>&1

cd /data-api && php bin/console messenger:consume rating.to.app --no-interaction --time-limit=0.1 > /dev/null 2>&1

cd /data-tips && php bin/console messenger:consume app.to.tip --no-interaction --time-limit=0.1 > /dev/null 2>&1
```
