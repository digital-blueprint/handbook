# Reverse Proxies & Load Balancer

In case your API is running behind a reverse proxy or a load balancer some
information of the connecting client, like IP, the used protocol, port etc might
get lost along the way.

Usually reverse proxies will forward this lost information in special HTTP
headers, like `x-forwarded-for`, `x-forwarded-proto` etc. Symfony will use those
headers if available as long as their source is trusted, otherwise if there
wasn't a reverse proxy in-between, then any client could fake those headers and
for example fake their IP.

See https://symfony.com/doc/current/deployment/proxies.html for the detailed
Symfony docs on how to configure this.

Here is a short summary for the common case:

* Create a `config/packages/framework.yaml` if it's not already there
* In case your API is only(!) accessible via a reverse proxy then you can just
  mark any connecting "client" as trusted:
  ```yaml
  framework:
      trusted_proxies: 'REMOTE_ADDR'
  ```
* Configure the headers managed by your reverse proxy, one ore more of
  `['x-forwarded-for', 'x-forwarded-port', 'x-forwarded-proto',
  'x-forwarded-host', 'x-forwarded-prefix']`. Make sure none(!) of them are user
  controlled and that they are properly handled by your reverse proxy:
  ```yaml
  framework:
      trusted_headers: ['x-forwarded-for', 'x-forwarded-port', 'x-forwarded-proto']
  ```

Programmatically you can access the information transported via those headers via the `Request` object:

```php
<?php
// Inject RequestStack into your service via auto-wiring
RequestStack $requestStack = ...;
$request = $requestStack->getCurrentRequest(); // get the active request

// All these results depend in one way or another on the trusted_proxies/trusted_headers config and the HTTPS headers
var_dump($request->getClientIp()); // x-forwarded-for
var_dump($request->getClientIps()); // x-forwarded-for
var_dump($request->getHost()); // x-forwarded-host
var_dump($request->getBaseUrl()); // x-forwarded-prefix
var_dump($request->getBasePath()); // x-forwarded-prefix
var_dump($request->getPort()); // x-forwarded-port
var_dump($request->isSecure()); // x-forwarded-proto
var_dump($request->isFromTrustedProxy()); // depends on the config and the real client IP
```
