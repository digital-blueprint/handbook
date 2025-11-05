# Overview

Source: https://github.com/digital-blueprint/relay-base-organization-bundle

```mermaid
graph TD
    style base_bundle fill:#606096,color:#fff

    org_provider("Organization Provider")

    subgraph API Gateway
        api(("API"))
        base_bundle("Base Organization Bundle")
        core_bundle("Core Bundle")
    end

    base_bundle --> org_provider
    base_bundle --> core_bundle
    api --> base_bundle
    api --> core_bundle

    click org_provider "./#organization-provider"
```

### Organization Provider

An interface that needs to be implemented and provides the organizational
structure of the institution. For example implemented via CAMPUSOnline or LDAP.
