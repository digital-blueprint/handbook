# Guidelines

A random list of things we try to keep consistent.

## Naming of Connector Bundles

The name should point to the system it connects to. In case there are multiple
systems it connects to, then the name of the "main" system is used. The main
system is the system which provides the data that ends up at the API bundle. If
there are multiple "main" systems then this has to be decided on a case by case
basis.

Example:

It connects to a database and LDAP to map some IDs, since LDAP is only used to
translate IDs and the real data it forwards comes from the database, the main
system is the database.

## Filtering based on resource IDs

* Parameter name:
    * Keep it consistent with the attribute of the result.
    * Describe the entity that needs to be passed in the API docs description.
* Value:
    * Just pass the identifier part, not the whole path or URL.

Example:

`https://example.api/bundle/things?member=1234`


## Client / Request information behind a Reverse Proxy

See [Reverse Proxies & Load Balancer](../reverse_proxies.md) for how to
configure Symfony in case your application is running behind a reverse proxy.

Instead of relying on HTTP headers or anything in `$_SERVER` you have to use the
Symfony `Request` object, which makes sure that any relevant special HTTP
headers are used, and only if they are trustworthy.

Here you see a list of `Request` methods and the underlying HTTP headers they
utilize, if behind a reverse proxy:

```php
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
