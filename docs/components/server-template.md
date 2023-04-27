# Server Template

The best starting point for your Relay API is the [API Server Template](https://gitlab.tugraz.at/dbp/relay/dbp-relay-server-template),
that can be used as a template for your own API instance.

It consists of a minimally configures Symfony application and development environment and includes/integrates:

- The [dbp/api-core-bundle](https://gitlab.tugraz.at/dbp/dbp-api/api-core-bundle): Which provides authentication, some same base end points and entities and configuration for [api-platform](https://api-platform.com/)
- A docker-compose based development environment
- Linter/Unittest integration

It also has the [DBP Symfony recipe repository](https://github.com/digital-blueprint/symfony-recipes) included,
so many DBP bundles get their configuration files and environment variables installed automatically.

## Installation

```bash
# Install the DBP API Server Template (https://gitlab.tugraz.at/dbp/relay/dbp-relay-server-template)
# as base Symfony PHP application
# The relay-api/public directory then is the directory to let the webserver point at 
composer create-project dbp/relay-server-template relay-api "dev-main"

# Change to app directory
cd relay-api

# Install dependencies (you need php and composer for this)
composer install
```

For more information please visit [API Server Template](https://gitlab.tugraz.at/dbp/relay/dbp-relay-server-template).