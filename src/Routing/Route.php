<?php

declare(strict_types=1);

namespace App\Routing;

class Route
{
    private string $method;
    private string $path;

    /** @var callable $action */
    private $action;

    public function __construct(string $method, string $path, $action)
    {
        $this->action = $action;
        $this->method = $method;
        $this->path = $path;
    }

    public static function create(string $method, string $path, callable $action): Route
    {
        return new self($method, $path, $action);
    }

    public static function createGet(string $path, callable $action): Route
    {
        return self::create('GET', $path, $action);
    }

    public static function createPost(string $path, callable $action): Route
    {
        return self::create('POST', $path, $action);
    }

    public static function createPut(string $path, callable $action): Route
    {
        return self::create('PUT', $path, $action);
    }

    public static function createDelete(string $path, callable $action): Route
    {
        return self::create('DELETE', $path, $action);
    }

    public function canHandle(string $method, string $path): bool
    {
        return $this->method === $method && $this->path === $path;
    }

    public function getHandler(): callable
    {
        return $this->action;
    }
}
