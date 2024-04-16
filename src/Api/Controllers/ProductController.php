<?php

declare(strict_types=1);

namespace App\Api\Controllers;

use App\Api\PdoFactory;

class ProductController
{


    public function __construct()
    {
    }

    public function index()
    {
        $pdo = PdoFactory::get();
        $stmt = $pdo->query('SELECT * FROM product');
        $ProductId = $_GET['id'] ?? 0;
        $sql = "SELECT * FROM product WHERE id = :product_id";

        $stmt = $pdo->prepare($sql);
        $stmt->execute(['product_id' => $ProductId]);
        $product = $stmt->fetch();
        echo '<pre>';
        print_r($product);
        echo '</pre>';
        return $product;
    }
}
