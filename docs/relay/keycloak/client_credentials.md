# Service Account & Client Credentials Flow

## Keycloak Setup

Related Keycloak docs: [https://www.keycloak.org/docs/latest/server_admin#_service_accounts](https://www.keycloak.org/docs/latest/server_admin#_service_accounts)

Summary:

* Add a keycloak client with only "Service Accounts Enabled" to enable the
  the [Client Credentials Flow](https://auth0.com/docs/api-auth/tutorials/client-credentials)
* Add the wanted scopes to the client
* Give the client name and secret to the external service

## PHP Example

```php
<?php

require_once 'vendor/autoload.php';

use GuzzleHttp\Client;

$KEYCLOAK_URL = "https://auth-dev.tugraz.at/auth";
$TOKEN_URL = $KEYCLOAK_URL . "/realms/tugraz-vpu/protocol/openid-connect/token";
$API_URL = "https://api-dev.tugraz.at";

// Credentials
$CLIENT_ID = "somekey-keycloak-client-id";
$CLIENT_SECRET = "deadbeef-dead-dead-dead-deadbeefdead";

// Fetch a token
$client = new Client();
$response = $client->post(
    $TOKEN_URL, [
    'auth' => [$CLIENT_ID, $CLIENT_SECRET],
    'form_params' => ['grant_type' => 'client_credentials']
]);
$data = (string) $response->getBody();
$json = json_decode($data, true, 512, JSON_THROW_ON_ERROR);
$accessToken = $json['access_token'];

// Access the API with the access token
$response = $client->get($API_URL . "/base/people/woody007", [
    'headers' => [
        'Authorization' => "Bearer $accessToken",
    ]
]);
$data = (string) $response->getBody();
$json = json_decode($data, true, 512, JSON_THROW_ON_ERROR);
var_dump($json);
```

## Python Example

```python
import requests

KEYCLOAK_URL = "https://auth-dev.tugraz.at/auth"
TOKEN_URL = KEYCLOAK_URL + "/realms/tugraz-vpu/protocol/openid-connect/token"
API_URL = "https://api-dev.tugraz.at"

# Credentials
CLIENT_ID="somekey-keycloak-client-id"
CLIENT_SECRET="deadbeef-dead-dead-dead-deadbeefdead"

# Fetch a token
r = requests.post(
    TOKEN_URL,
    auth=(CLIENT_ID, CLIENT_SECRET),
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
