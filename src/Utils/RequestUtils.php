<?php

declare(strict_types=1);

namespace App\Utils;

class RequestUtils
{
    public static function getRequestMethod(): string
    {
        return $_SERVER['REQUEST_METHOD'];
    }

    public static function getRequestPath(): string
    {
        return explode('?', $_SERVER['REQUEST_URI'] ?? '/')[0];
    }

    public static function getRequestData(): object
    {
        $request = new \stdClass();
        $request->params = self::getRequestMethod() === 'GET' ? $_GET : $_POST;

        return $request;
    }
}
