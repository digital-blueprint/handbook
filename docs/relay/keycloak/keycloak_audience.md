---
title: Setting an Audience in Keycloak
---

To prevent access tokens issued by the same Keycloak server, but meant for other
services, to be used with our API Gateway we can set an "Audience" for the
generated tokens. For more info see the [Keycloak documentation on this
subject](https://www.keycloak.org/docs/latest/server_admin/#_audience).

For how to add a hardcoded audience to a Keycloak client see [the
docs](https://www.keycloak.org/docs/latest/server_admin/#_audience_hardcoded).

Here is a short summary:

* Create a "Client Scope", e.g. `api-gw-audience`
* Disable "Include In Token Scope" and "Display On Consent Screen" (not strictly
  needed, but it's not a real scope)
* Go to "Mappers" and "Create" a new mapper
* "Mapper Type" is "Audience", set "Included Custom Audience" to `api-gw`
  and enable "Add to access token"

By adding this client scope to a client the generated tokens will have their
`aud` field set to `api-gw`.

The resource server (API-GW) then needs to check that the (valid) access token
as the audience `api-gw` and if not reject the token because it was meant for
another service.