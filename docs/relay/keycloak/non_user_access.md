---
title: Non-User Access
---

## Accessing the API from an external service

Related Keycloak docs: [https://www.keycloak.org/docs/latest/server_admin#_service_accounts](https://www.keycloak.org/docs/latest/server_admin#_service_accounts)

Summary:

* Add a keycloak client with only "Service Accounts Enabled" to enable the
  the [Client Credentials Flow](https://auth0.com/docs/api-auth/tutorials/client-credentials)
* Add the wanted scopes to the client
* Give the client name and secret to the external service

## Example

The following Python example shows how to get an access token from Keycloak and
how to access the API using that token.

```python
import requests

KEYCLOAK_URL = "https://auth.tugraz.at/auth"
TOKEN_URL = KEYCLOAK_URL + "/realms/tugraz/protocol/openid-connect/token"
API_URL = "https://api.tugraz.at"

# Credentials
CLIENT_ID="somekey-keycloak-client-id"
CLIENT_SECRET="deadbeef-dead-dead-dead-deadbeefdead"

# Fetch a token pair
r = requests.post(
    TOKEN_URL, auth=(CLIENT_ID, CLIENT_SECRET),
    data={'grant_type': 'client_credentials'})
r.raise_for_status()
access_token = r.json()["access_token"]

# Access the API with the access token
r = requests.get(
    API_URL + "/people/woody007",
    headers={'Authorization': 'Bearer ' + access_token})
r.raise_for_status()
print(r.json())
```