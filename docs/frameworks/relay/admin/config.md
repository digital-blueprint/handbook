# Gateway Configuration

The source of all configuration is the `.env` file in the root directory which
looks like this:

```bash
...
###> symfony/framework-bundle ###
APP_ENV=dev
APP_SECRET=
###< symfony/framework-bundle ###
...
```

It sets environment variables which are then used in the [bundle configuration](#bundle-configuration) files under `config/packages`.

In addition you can create a `.env.local` file which the API gateway will
combine with the `.env`file. There you can include secrets which will not be
checked into source control.

For more details on the different `.env` files, see [
Configuring Symfony
](https://symfony.com/doc/current/configuration.html)

## The .env Syntax

The .env files syntax is a subset of POSIX SHELL syntax. Here are some tips and
tricks for how to handle value corner cases:

```bash
# In case there are no special characters this is fine
SOME_KEY=foobar

# Quote with " when the value includes spaces
SOME_KEY="foo bar"

# Escape " with \
SOME_KEY="foo\"bar"

# Escape $ with \ as well
SOME_KEY="foo\$bar"

# When credentials are part of an URL they need to be URL escaped
# For example "$secret" -> "%24ecret"
SOME_URL="mysql://username:%24ecret@hostname/dbname"

# A value that spans multiple lines
SOME_KEY="-----BEGIN RSA PRIVATE KEY-----
...
HkVN9...
...
-----END DSA PRIVATE KEY-----"
```

<script>
function _quote() {
    prompt('Quoted String', '"' + prompt('Input').replace(/\\/g, '\\\\').replace(/"/g, '\\"').replace(/\$/g, '\\$') + '"');
}

function _urlescape() {
    prompt('URL Encoded Result', encodeURIComponent(prompt('Input')));
}
</script>

To help with converting values to the right format, here are some Javascript helpers for

* converting any text to a quoted value suitable for a `.env` file: <a href="#" onclick="event.preventDefault(); _quote();">Quote Text</a>
* converting any text to a value suitable for including it in an URL: <a href="#" onclick="event.preventDefault(); _urlescape();">URL Escape</a>

For more info on the syntax see [.env File Syntax](https://symfony.com/doc/current/configuration.html#env-file-syntax)

## Bundle Configuration

Each bundle can be configured via a bundle configuration yaml file
which lives under `config/packages`.

For example the `dbp_relay_core.yaml`:

```yaml
dbp_relay_core:
  build_info: '%env(CORE_API_BUILDINFO)%'
  build_info_url: '%env(CORE_API_BUILDINFO_URL)%'
  docs_title: 'API Gateway'
  docs_description: '*powered by the Relay API gateway - part of the [Digital Blueprint](https://github.com/digital-blueprint) project*'
  queue_dsn: 'doctrine://queue_connection'
  lock_dsn: '%env(CORE_LOCK_DSN)%'
```

You can either change the config in there directly or reference environment
variables that are set in the `.env` or `.env.local` file.

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
    docs_description:     '*part of the [Digital Blueprint](https://github.com/digital-blueprint) project*'
    messenger_transport_dsn: '' # Deprecated (Since dbp/relay-core-bundle 0.1.20: Use "queue_dsn" instead.)
    # See https://symfony.com/doc/5.3/messenger.html#redis-transport
    queue_dsn:            '' # Example: 'redis://localhost:6379'
    # https://symfony.com/doc/5.3/components/lock.html
    lock_dsn:             '' # Example: 'redis://redis:6379'
```