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

cd data-match/ && php bin/console messenger:consume match.api.to.match

cd /data-calculation-list && php bin/console messenger:consume match.to.calculation
cd /data-calculation-list && php bin/console messenger:consume tip.list.to.calculation



```
