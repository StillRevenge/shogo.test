<?php

declare(strict_types=1);

namespace App\Api\Controllers;

use PDO;
use App\Api\PdoFactory;

class HomeController
{
    public function index()
    {
        $pdo = PdoFactory::get();
        $stmt = $pdo->query('SELECT * FROM product');

        while ($row = $stmt->fetch()) {
            echo '<pre>';
            print_r($row);
            echo '</pre>';
        }

        return 'Hello World';
    }
    public function viewTable()
    {
        $pdo = PdoFactory::get();
        $stmt = $pdo->query('SELECT * FROM product_view');
        while ($row = $stmt->fetch()) {
            echo '<pre>';
            print_r($row);
            echo '</pre>';
        }
    }
}
