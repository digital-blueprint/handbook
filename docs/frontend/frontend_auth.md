
# Frontend Authentication

For frontend authentication we use [OpenID
Connect](https://openid.net/connect/). In practice we use
[Keycloak](https://www.keycloak.org), but any OIDC service should work. Although
we haven't tested with any other implementation, so some fixes might be needed
there.

## Keycloak Client Setup

In case you use the `dbp-auth-keycloak` web component you need to configure it
with the Keycloak realm, client ID and so on. In addition you have to create a
matching client on the Keycloak side of things. This client needs to map some
things into the access token for `dbp-auth-keycloak` to work:

* The "full name" needs to be included in the token
* The "username" needs to be included in the token
* The "audience" field needs to be set to include the API gateway required audience value

You can combine all these mappers into one client scope:

![](keycloak_token_1.png){: style="max-width: 400px; border: 1px solid #000"}

The client scope includes three mappers, the first two are builtin ones for "username" and "full name":

![](keycloak_token_2.png){: style="max-width: 400px; border: 1px solid #000"}

The last mapper is a new one of the type "Audience". Set the custom audience value to the one expected by the API gateway:

![](keycloak_token_3.png){: style="max-width: 400px; border: 1px solid #000"}

After all this is set up you can add this client scope to all frontend related Keycloak clients as a default scope.