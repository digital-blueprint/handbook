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
