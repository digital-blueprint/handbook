# Scopes in Keycloak

## Mapping Roles to OAuth2 Scopes in Keycloak

We want to assign various roles to users/clients in Keycloak and as a result let
them have various scopes. These scopes are then used to authorize various
operations in the backend.

Why not access the roles directly in the backend?

This way your roles and groups don't leak from Keycloak and by mapping them all
to scopes it makes it easier to use another IDP as longs as the scopes are the
same.

### Adding a Role to a User and Mapping it to a Scope

* Add a role under Realm > Roles, "im_special_role"
* Add the role to a user
* Under "Realm > Client Scopes" add a client scope, for example
  "special_thing_scope"
* In the client scope under "Scope" add the "im_special_role" role (Note: adding
  no roles makes the scope available to all)
* In a client under "Client Scopes" add the "special_thing_scope" to the default
  scopes

Result:

* If and only if the user requests a token through the client and if the user
  has the "im_special_role" the resulting token will contain the
  "special_thing_scope" scope.

### Adding a Role/Scope to a Client with a Service Account

* Assuming the "Client Scope" exists and is restricted to a special role
* In the client under "Client Scopes" add "special_thing_scope" to the default
  scopes
* In the client under "Service Account Roles" add the "im_special_role" to the
  assigned roles

Result:

* All tokens requested through the client with the service account will contain
  the "special_thing_scope"

## Adding an OAuth2 Scope without any Roles

We want to assign a default scope to a specific client so that all users using
that client get that scope.

* Under "Realm > Client Scopes" add a client scope, for example
  "special_thing_scope"
* In a client under "Client Scopes" add the "special_thing_scope" to the default
  scopes