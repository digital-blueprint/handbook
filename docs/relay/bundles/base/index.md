# Overview

```mermaid
graph TD
    style base_bundle fill:#606096,color:#fff

    person_provider("Person Provider")
    org_provider("Organization Provider")

    subgraph API Gateway
        api(("API"))
        base_bundle("Base Bundle")
        core_bundle("Core Bundle")
    end

    base_bundle --> person_provider
    base_bundle --> org_provider
    base_bundle --> core_bundle
    api --> base_bundle
    api --> core_bundle

    click org_provider "./#organization-provider"
    click org_provider "./#ldap"
```

### Organization Provider

An interface that needs to be implemented and provides the organizational
structure of the institution. For example implemented via CAMPUSOnline or LDAP.

### Person Provider

An interface that needs to be implemented and provides the information for all
API users. Can be implemented using LDAP, Keycloak, CAMPUSOnline, etc. or a
combination of multiple backends.
