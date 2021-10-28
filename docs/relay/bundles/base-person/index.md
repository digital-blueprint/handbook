# Overview

```mermaid
graph TD
    style base_bundle fill:#606096,color:#fff

    person_provider("Person Provider")

    subgraph API Gateway
        api(("API"))
        base_bundle("Base Person Bundle")
        core_bundle("Core Bundle")
    end

    base_bundle --> person_provider
    base_bundle --> core_bundle
    api --> base_bundle
    api --> core_bundle

    click person_provider "./#person-provider"
```

### Person Provider

An interface that needs to be implemented and provides the information for all
API users. Can be implemented using LDAP, Keycloak, CAMPUSOnline, etc. or a
combination of multiple backends.
