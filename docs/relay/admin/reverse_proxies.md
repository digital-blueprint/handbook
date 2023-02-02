# Reverse Proxies & Load Balancers

In case your API is running behind a reverse proxy or a load balancer some
information of the connecting client, like IP, the used protocol, port etc might
get lost along the way.

Usually reverse proxies will forward this lost information in special HTTP
headers, like `x-forwarded-for`, `x-forwarded-proto` etc. Symfony will use those
headers if available as long as their source is trusted, otherwise if there
wasn't a reverse proxy in-between, then any client could fake those headers and
for example fake their IP.

We require that you configure all ``x-forwarded-*` headers that could be
relevant in your setup, and which are supported by your proxies.

See https://symfony.com/doc/current/deployment/proxies.html for the detailed
Symfony docs on the configuration.

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
  controlled and that they are properly handled by your reverse proxy, usually
  the following set is enough:
  ```yaml
  framework:
      trusted_headers: ['x-forwarded-for', 'x-forwarded-port', 'x-forwarded-proto']
  ```

To make sure that everything is working, you can visit the API website, and
check the bottom right corner, where it should show the host, ip, scheme, port
of the request, as the gateway sees them.
