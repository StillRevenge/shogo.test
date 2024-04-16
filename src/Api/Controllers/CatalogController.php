<?php

declare(strict_types=1);

namespace App\Api\Controllers;

use App\Api\PdoFactory;

class CatalogController
{
    public function index()
    {
        $pdo = PdoFactory::get();
        $sql = "SELECT ps.id, ps.name AS category_name, COUNT(p.id) AS product_count
            FROM product_section ps
            LEFT JOIN product_assignment pa ON ps.id = pa.section_id
            LEFT JOIN product p ON pa.product_id = p.id
            WHERE ps.visible = 1
            GROUP BY ps.id, ps.name
            ORDER BY ps.name";
        $stmt = $pdo->query($sql);

        while ($row = $stmt->fetch()) {
            echo '<pre>';
            print_r($row);
            echo '</pre>';
        }
        $categoris = $stmt->fetchAll();
        return $categoris;
    }
    public function getCat()
    {
        $categoryId = $_GET['id'] ?? 0;
        $pdo = PdoFactory::get();
        $sql = "SELECT 
        p.name AS product_name,
        p.price_old AS old_price,
        p.price AS new_price,
        p.notice AS description
    FROM 
        product p
    LEFT JOIN 
        product_assignment pa ON p.id = pa.product_id
    WHERE 
        pa.section_id = :category_id";

        $stmt = $pdo->prepare($sql);
        $product = $stmt->execute(['category_id' => $categoryId]);
        while ($row = $stmt->fetch()) {
            echo '<pre>';
            print_r($row);
            echo '</pre>';
        }

        return true;
    }
}
