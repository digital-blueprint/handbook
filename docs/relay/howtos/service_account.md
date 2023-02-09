# Creating a Service Account for the Client Credentials Flow

Related Keycloak docs: <https://www.keycloak.org/docs/latest/server_admin#_service_accounts>

Add a service account to enable the "Client Credentials" flow:

* Add a keycloak client with only "Service Accounts Enabled" to enable the
  the [Client Credentials Flow](https://auth0.com/docs/api-auth/tutorials/client-credentials)
* Add the wanted scopes to the client
* Give the client name and secret to the external service
