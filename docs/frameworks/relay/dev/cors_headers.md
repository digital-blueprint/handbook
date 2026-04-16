# Custom HTTP Headers

I the "Extension" file under `DependencyInjection/*Extension.php`, using the
`ExtensionTrait` you can register headers that are accessible via CORS:

Add a header to [Access-Control-Expose-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Expose-Headers)

```php
public function prepend(ContainerBuilder $container)
{
    $this->addExposeHeader($container, 'X-Some-Header', routePrefix: '/my-bundle/');
    // ...
```

Add a header to [Access-Control-Allow-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers)

```php
public function prepend(ContainerBuilder $container)
{
    $this->addAllowHeader($container, 'X-Some-Header', routePrefix: '/my-bundle/');
    // ...
```

`routePrefix` defaults to `'/'`, meaning the header will be added to all routes.
You can specify a different prefix to only add the header to specific routes,
for example the routes your bundle provides.
