# Bundle Configuration

Each bundle can be configured via a bundle configuration yaml file
which lives under `config/packages`.

For example the `dbp_relay_core.yaml`:

```yaml
dbp_relay_core:
  build_info: '%env(CORE_API_BUILDINFO)%'
  build_info_url: '%env(CORE_API_BUILDINFO_URL)%'
  docs_title: 'API Gateway'
  docs_description: '*powered by the Relay API gateway - part of the [Digital Blueprint](https://gitlab.tugraz.at/dbp) project*'
  queue_dsn: 'doctrine://queue_connection'
  lock_dsn: '%env(CORE_LOCK_DSN)%'
```

You can either change the config in there directly or reference environment
variables that are set in the `.env` or `.env.local` file. See the [Gateway
Configuration](./config.md) for more information.

Using environment variables is preferred for things that depend on your
deployment environment, such as URLs, hostnames, and secrets. This allows you to
provide one `.env.local` on the server with all the configuration matching your
deployment environment and also means everything that can/should be changed is
managed in one place.

## Core Bundle Configuration

Created via `./bin/console config:dump-reference DbpRelayCoreBundle | sed '/^$/d'`

```yaml
# Default configuration for "DbpRelayCoreBundle"
dbp_relay_core:
    # Some string identifying the current build (commit hash)
    build_info:           ~ # Example: deadbeef
    # Some URL identifying the current build (URL to the commit on some git web interface)
    build_info_url:       ~ # Example: 'https://gitlab.example.com/project/-/commit/deadbeef'
    # Path to the logo (256x256) of the API frontend
    logo_path:            ~ # Example: 'bundles/dbprelaycore/logo.png'
    # The title text of the API docs page
    docs_title:           'Relay API Gateway'
    # The description text of the API docs page (supports markdown)
    docs_description:     '*part of the [Digital Blueprint](https://gitlab.tugraz.at/dbp) project*'
    messenger_transport_dsn: '' # Deprecated (Since dbp/relay-core-bundle 0.1.20: Use "queue_dsn" instead.)
    # See https://symfony.com/doc/5.3/messenger.html#redis-transport
    queue_dsn:            '' # Example: 'redis://localhost:6379'
    # https://symfony.com/doc/5.3/components/lock.html
    lock_dsn:             '' # Example: 'redis://redis:6379'
```
