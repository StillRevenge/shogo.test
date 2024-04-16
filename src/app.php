<?php

use App\Api\Controllers\HomeController;
use App\Api\Controllers\ProductController;
use App\Api\Controllers\CatalogController;
use App\Routing\Route;
use App\Routing\Router;
use App\Utils\RequestUtils;

$productController = new ProductController();
$homeController = new HomeController();
$catalogController = new CatalogController();

$routes = [
    Route::createGet('/home', [$homeController, 'index']),
    Route::createGet('/catalog', [$catalogController, 'index']),
    Route::createGet('/catalog/', [$catalogController, 'getCat']),
    Route::createGet('/product/', [$productController, 'index']),
    Route::createGet('/view', [$homeController, 'viewTable'])
];


$router = new Router($routes);
$handler = $router->findRequestHandler(RequestUtils::getRequestMethod(), RequestUtils::getRequestPath());

if ($handler === null) {
    echo "<h1>Page not found</h1>";

    return;
}

$request = RequestUtils::getRequestData();
$response = $handler($request);

echo json_encode($response);
