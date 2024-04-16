<?php

declare(strict_types=1);

namespace App\Api;

use PDO;

class PdoFactory
{
    private static ?PDO $pdo = null;

    public static function get(): PDO
    {
        if (self::$pdo !== null) {
            return self::$pdo;
        }

        self::$pdo = new PDO(
            'mysql:host=localhost;dbname=shop',
            'root',
            '',
            [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
            ]
        );

        return self::$pdo;
    }
}
