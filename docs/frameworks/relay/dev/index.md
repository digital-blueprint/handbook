# Overview

The relay API gateway is written in [PHP](https://www.php.net/) and is based on
the [API Platform](https://api-platform.com) framework as well as the
[Symfony](https://www.symfony.com) framework. 

To achieve modularity and extensibility we depend on the Symfony bundle system
which allows installing "extra parts" to an existing application server, like
new API endpoints, new adapters to external systems, and so on.

The following graph shows a more technical overview of how a bundle integrates
into the API gateway:

```mermaid
flowchart LR
    style ext_service1 fill:#46A046,color:#fff
    style ext_service2 fill:#46A046,color:#fff
    style oidc_server fill:#C1665A,color:#fff
    style client fill:#FFBB00,color:#000

    client("Client")
    oidc_server("OIDC Server")

    subgraph "Relay Gateway"

        subgraph api_platform["API Platform / Symfony"]
            direction LR
            api_docs("API Documentation")
            api("REST API")
        end

        subgraph core_bundle["Core Bundle"]
            direction LR
            locking("Locking")
            message_queue("Message Queue")
            authentfication("Authentification")
            cron_jobs_management("Cron Jobs")
            logging("Logging")
        end

    end

    api_platform <--> core_bundle

    subgraph "Extension Bundle"
        direction TB
        connector_interface("Connector Interface")

        subgraph ext_apis["Extensions"]
            direction LR
            entities("API Resources")
            heath_checks("Health Checks")
            cron_jobs("Cron Jobs")
            async_message("Async Messages")
            routes("Symfony Routes")
            cli_commands("CLI Commands")
        end

        ext_apis --> connector_interface
    end

    subgraph "Connector Bundle"
        impl("Implementation")
    end

    ext_apis --> ext_service2
    client --> api_platform
    client --> oidc_server

    core_bundle <--> ext_apis
    core_bundle --> oidc_server
    ext_service1("External Service X")
    ext_service2("External Service Y")

    impl --> ext_service1
    connector_interface --> impl
```

The core bundle provides various common functionality to all bundles and also
allows bundles to extend the API gateway in various ways, so they can:

* use the [logging system](./logging.md)
* use the [locking system](./locks.md)
* register [new API resources](./api.md) and expose the added API in the
  generated OpenAPI documentation
* register new [health checks](./health_checks.md)
* register new [cron jobs](./cron.md)
* [register Symfony messages](./queue.md) to be routed to the global worker queue
* register [custom Symfony routes](./api.md) for special endpoints that
  don't fit the api-platform design
* register [CLI commands](./cli_commands.md) accessible via the Symfony console

## Bundle Architecture

See [Extending with Bundles](../admin/extending_with_bundles.md) for the different
types of bundles and their use cases.
