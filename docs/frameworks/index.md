# Overview

This section contains documentation for integrators, system administrators,
designers, developers and users of our front-end and back-end frameworks.

```mermaid
flowchart LR
    style gateway stroke:#338555,color:#338555
    style frontend stroke:#9e1e4d,color:#9e1e4d

    subgraph frontend["Frontend Framework"]
        webapp["Web Application"]
        activitiy["Web Activity"]
    end

    subgraph system["Backend System"]
        apiclient["HTTP Client"]
    end

    subgraph gateway["Relay API Gateway"]
        api["API Gateway"]
        subgraph bundle_1["Bundle"]
          bundle_1a["Bundle"]
        end
        subgraph bundle_2["Bundle with Connector"]
          direction TB
          bundle_2a["Bundle 2"]
          connector["Connector"]
        end
    end

    backend_1["Backend 1"]
    backend_2["Backend 2"]
    
    bundle_1a ---> backend_1
    connector --> backend_2

    api --> bundle_1a
    api --> bundle_2a

    webapp --> gateway
    activitiy --> gateway
    apiclient --> gateway

    bundle_2a["Bundle"] --> connector["Connector"]
```

The digital blueprint framework is open source and consists of a modular [API gateway](./relay) providing a REST
API as well as a web component based [frontend framework](./frontend) for
building web applications as well as single activities that can be embedded in
existing web applications.
