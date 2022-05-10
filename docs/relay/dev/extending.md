# Extending the API Gateway

This gives a quick overview over how to extend the API gateway with your bundle.

The main entry point for extending is the "Extension" file under
`DependencyInjection/*Extension.php`. The `ExtensionTrait` used there provides
various methods for registering things.

## Registering API Resources

Use `addResourceClassDirectory()` to register a directory with API-Platform entities which are annotated with `APIResource`.

```php
public function loadInternal(array $mergedConfig, ContainerBuilder $container)
{
    $this->addResourceClassDirectory($container, __DIR__.'/../Entity');
    // ...
```

If you want to hide certain operations from the API docs because the resource is internal, or an operation can't be implemented but is required by API-Platform then you can hide it via:

```php
public function loadInternal(array $mergedConfig, ContainerBuilder $container)
{
    $this->addPathToHide($container, '/checkin/check-in-actions/{identifier}');
    // ...
```

You can get a list of all paths via `./bin/console debug:router`

## Registering a Symfony Route Configuration

If you have a Symfony route that you can to register:

```php
public function loadInternal(array $mergedConfig, ContainerBuilder $container)
{
    $this->addRouteResource($container, __DIR__.'/../Resources/config/routes.yaml', 'yaml');
    // ...
```

## Registering HTTP Headers for CORS

Add a header to [Access-Control-Expose-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Expose-Headers)

```php
public function prepend(ContainerBuilder $container)
{
    $this->addExposeHeader($container, 'X-Some-Header');
    // ...
```

Add a header to [Access-Control-Allow-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers)

```php
public function prepend(ContainerBuilder $container)
{
    $this->addAllowHeader($container, 'X-Some-Header');
    // ...
```

## Registering a Message Class for the global Message Queue

See https://symfony.com/doc/current/messenger.html for details.

Register a message class, so when it gets dispatched it gets handled by the
global async message queue.

```php
public function prepend(ContainerBuilder $container)
{
    $this->addQueueMessage($container, GuestCheckOutMessage::class);
    // ...
```
