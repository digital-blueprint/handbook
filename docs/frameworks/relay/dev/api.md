# Creating APIs

You can add new APIs by registering api-platform entities or registering Symfony
routes. The former will end up in the auto-gernated API docs, the later can be
used for internal/special APIs, if required.

See https://api-platform.com/docs/core/operations/ for how to work with the
api-platform provided `ApiResource`.

## Registering API Resources

Use `addResourceClassDirectory()` to register a directory with API-Platform entities which are annotated with `APIResource`.

```php
// In *Extension.php, using the ExtensionTrait
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
// In *Extension.php, using the ExtensionTrait
public function loadInternal(array $mergedConfig, ContainerBuilder $container)
{
    $this->addRouteResource($container, __DIR__.'/../Resources/config/routes.yaml', 'yaml');
    // ...
```
