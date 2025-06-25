$env:APP_ENV = "prod"
$env:APACHE_PORT = 8081
$env:DB_PORT = 3308
docker-compose -p videgrenier-bloc5-prod -f docker-compose.yaml up