# Overview

The Digital Blueprint project consists of blueprints. Each blueprint consists of several components, such as front-end applications, back-end APIs, existing software projects with extensions, or other supporting software. Together they provide a service for your users.

```mermaid
flowchart TB
    style blueprint_a stroke:#338555,color:#338555
    style blueprint_b stroke:#9e1e4d,color:#9e1e4d
    style blueprint_c stroke:#336885,color:#336885

    subgraph " "
      direction TB

      subgraph blueprint_a ["Blueprint A"]
          direction LR
          component_1["App Component"]
          component_2["API Component"]
      end

      subgraph blueprint_b ["Blueprint B"]
          direction LR
          component_3["App Component"]
          component_4["API Component"]
          component_5["Supporting Software Component"]
      end

      subgraph blueprint_c ["Blueprint C"]
          direction LR
          component_6["Application"]
          component_7["Application Extension"]
      end

    end
```

Many of the components, which make up a blueprint, make use of our own frontend and API framework.

```mermaid
flowchart LR
    style blueprint_a stroke:#338555,color:#338555
    style frameworks stroke:#9e1e4d,color:#9e1e4d

    subgraph " "
      direction LR

      subgraph frameworks["Frameworks"]
          frontend["Frontend Framework"]
          backend["Relay API Gateway"]
      end

      subgraph blueprint_a ["Blueprint A"]
          direction LR
          component_1["App Component"]
          component_2["API Component"]
      end
    end

    component_1 --- frontend
    component_2 --- backend
```

Many of the components are not tied to their blueprints and can be re-used in external contexts, like your own applications.

```mermaid
flowchart LR
    style component_1 stroke:#338555,color:#338555
    style component_2 stroke:#9e1e4d,color:#9e1e4d

    subgraph yourapp["Your Application"]
    direction LR
        component_1["digital blueprint Component"]
        component_2["Your Component"]
    end
```
