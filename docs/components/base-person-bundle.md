# BasePerson Bundle

The BasePerson Bundle provides an entity and endpoints to access persons via the API.

## Installation

!!! warning "Important"

    Make sure you are using the [API Server Template](https://gitlab.tugraz.at/dbp/relay/dbp-relay-server-template) as
    template Symfony application or have added the [DBP Symfony recipe repository](https://github.com/digital-blueprint/symfony-recipes)
    to your application to get the configuration file and environment variables installed automatically.


```bash
# Install the bundle
composer require dbp/relay-base-person-bundle
```

## Implement PersonProviderInterface

You need to implement a service for `PersonProviderInterface` from [Base Person Bundle](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-bundle#personprovider-service)
to actually fetch persons from a source.

!!! tip

    If you are using LDAP as your source for identity management, you can install and configure the
    [BasePerson Connector Bundle for LDAP](./base-person-connector-ldap-bundle.md),
    which allows you to connect the BasePerson Bundle to your LDAP server.

