# Overview

```mermaid
graph TD
    style core_bundle fill:#606096,color:#fff

    subgraph API Gateway
        api(("API"))
        auth_bundle("Auth Bundle")
        core_bundle("Core Bundle")
        core_bundle --> auth_bundle
        api --> core_bundle
    end

    click auth_bundle "./#auth-bundle"
    click user_session "./#usersession"
```

### Auth Bundle

The auth bundle takes care of user authentication and communicates with an OIDC
server, for example [Keycloak](https://www.keycloak.org). It creates the Symfony
user object and converts OAuth2 scopes to Symfony user roles.