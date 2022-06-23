# Overview

This handbook contains documentation for integrators, system administrators,
designers, developers and users of the DBP framework.

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
        bundle_1["Bundle"]
        bundle_2["Bundle"]
    end

    backend_1["Backend"]
    backend_2["Backend"]

    bundle_1 --> backend_1
    bundle_2 --> backend_2

    api --> bundle_1
    api --> bundle_2

    webapp --> gateway
    activitiy --> gateway
    apiclient --> gateway
```

The DBP framework is open source and consists of a modular [API gateway](./relay) providing a REST
API as well as a web component based [frontend framework](./frontend) for
building web applications as well as single activities that can be embedded in
existing web applications.
