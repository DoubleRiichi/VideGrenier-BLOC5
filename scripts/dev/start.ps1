$env:APP_ENV = "dev"
$env:APACHE_PORT = 8088
$env:DB_PORT = 3306
docker-compose -p videgrenier-bloc5-dev -f docker-compose.yaml up