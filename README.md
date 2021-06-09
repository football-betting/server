# Football betting

## Local setup
Run the following command to start the setup

```bash
PUID=${UID} docker-compose -f docker-compose.yml -f docker-compose.local.yml up -d --build
```

Now initialize the app by running the following commands.

For the API
```bash
docker-compose exec -T php-fpm bash -c "cd /data-api && bash init.sh"
```

For the Tip Service
```bash
docker-compose exec -T php-fpm bash -c "cd /data-tips && composer install -o"
```

For the Match Service
```bash
docker-compose exec -T php-fpm bash -c "cd /data-match && composer install -o"
```

You can access the apps now on

|App|Url|
|---|---|
|Api|http://localhost:8080|
|Tip|http://localhost:8081|
|Match|http://localhost:8082|
|Rabbit MQ Admin|http://localhost:8085|
|Redis Commander|http://localhost:8086|
