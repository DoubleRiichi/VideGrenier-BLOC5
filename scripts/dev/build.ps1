$env:APP_ENV = "dev"
$env:APACHE_PORT = 8088
$env:DB_PORT = 3306
./videgrenier/vendor/bin/phpunit ./videgrenier/tests/
docker run --rm -v "$(pwd):/data" phpdoc/phpdoc:3
docker-compose -p videgrenier-bloc5-dev -f docker-compose.yaml up --build --force-recreate