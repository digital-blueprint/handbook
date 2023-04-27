# Auth Bundle

The [Auth Bundle](https://gitlab.tugraz.at/dbp/relay/dbp-relay-auth-bundle) provides
[Keycloak](https://www.keycloak.org/) authentication integration for the dbp Relay API Server.

## Configuration

To [Configure the Auth Bundle](https://dbp-demo.tugraz.at/handbook/relay/bundles/auth/config/) you just need to
adapt all `AUTH_` settings in your `.env`.

```bash
AUTH_SERVER_URL=https://auth.your-server/auth/realms/your-realm
AUTH_APIDOCS_KEYCLOAK_SERVER=https://auth.your-server/auth
AUTH_APIDOCS_KEYCLOAK_REALM=your-realm
AUTH_APIDOCS_KEYCLOAK_CLIENT_ID=api-docs-client-id
```

The `AUTH_APIDOCS_` values are optional and only needed for logging into the
OpenAPI documentation website provided by the backend. The corresponding
Keycloak client needs to be configured like any other frontend app. You can
leave the values empty to disable the login functionality.
