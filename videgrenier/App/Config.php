<?php

namespace App;

use Dotenv\Dotenv;

Config::init();

/**
 * Application configuration
 *
 * PHP version 7.0
 */
class Config
{
    public static $DB_HOST;
    public static $DB_PORT;
    public static $DB_NAME;
    public static $DB_USER;
    public static $DB_PASSWORD;
    public static $SHOW_ERRORS = true;

    public static function init()
    {
        $envPath = __DIR__ . '/../';
        $dotenv = Dotenv::createImmutable($envPath, ".env");
        $dotenv->safeLoad();

        self::$DB_HOST = $_ENV['DB_HOST'] ?? 'localhost';
        self::$DB_PORT = $_ENV['DB_PORT'] ?? '3306';
        self::$DB_NAME = $_ENV['DB_NAME'] ?? 'videgrenierenligne-dev';
        self::$DB_USER = $_ENV['DB_USER'] ?? 'default_user';
        self::$DB_PASSWORD = $_ENV['DB_PASSWORD'] ?? 'default_password';
        self::$SHOW_ERRORS = filter_var($_ENV['SHOW_ERRORS'] ?? true, FILTER_VALIDATE_BOOLEAN);

    }
}