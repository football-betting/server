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
