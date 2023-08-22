# Client Credentials Flow Example

The following shows how to retrieve an access token from the OAuth2 server using the "Client Credentials" flow and then accessing the API with it. In this example we use Keycloak as the OAuth2 server.

## curl/jq Example

```bash
#!/bin/bash

set -e -o pipefail

KEYCLOAK_URL="https://auth.tugraz.at/auth"
REALM="tugraz"
API_URL="https://api.tugraz.at"

# Credentials
CLIENT_ID="somekey-keycloak-client-id"
CLIENT_SECRET="deadbeef-dead-dead-dead-deadbeefdead"

# Fetch a token
TOKEN_URL="$KEYCLOAK_URL/realms/$REALM/protocol/openid-connect/token"
ACCESS_TOKEN=$(curl --silent --show-error --fail-with-body -X POST "$TOKEN_URL" \
  -d "grant_type=client_credentials" \
  -d "client_id=$CLIENT_ID" \
  -d "client_secret=$CLIENT_SECRET" | jq -r '.access_token')

# Access the API with the access token
curl --silent --show-error --fail-with-body -H "Authorization: Bearer $ACCESS_TOKEN" "$API_URL/base/people/811EC3ACC0ADCA70" | jq
```

## PHP Example

```console
$ composer require guzzlehttp/guzzle
$ php test.php
```

```php
// test.php
<?php

require_once 'vendor/autoload.php';

use GuzzleHttp\Client;

$KEYCLOAK_URL = "https://auth.tugraz.at/auth";
$REALM = "tugraz";
$API_URL = "https://api.tugraz.at";

// Credentials
$CLIENT_ID = "somekey-keycloak-client-id";
$CLIENT_SECRET = "deadbeef-dead-dead-dead-deadbeefdead";

// Fetch a token
$TOKEN_URL = "$KEYCLOAK_URL/realms/$REALM/protocol/openid-connect/token";
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
$response = $client->get($API_URL . "/base/people/811EC3ACC0ADCA70", [
    'headers' => [
        'Authorization' => "Bearer $accessToken",
    ]
]);
$data = (string) $response->getBody();
$json = json_decode($data, true, 512, JSON_THROW_ON_ERROR);
var_dump($json);
```

## Python Example

```console
$ pip3 install requests
$ python3 test.py
```

```python
# test.py
import requests

KEYCLOAK_URL = "https://auth.tugraz.at/auth"
REALM = "tugraz"
API_URL = "https://api.tugraz.at"

# Credentials
CLIENT_ID="somekey-keycloak-client-id"
CLIENT_SECRET="deadbeef-dead-dead-dead-deadbeefdead"

# Fetch a token
TOKEN_URL = KEYCLOAK_URL + "/realms/" + REALM + "/protocol/openid-connect/token"
r = requests.post(
    TOKEN_URL,
    auth=(CLIENT_ID, CLIENT_SECRET),
    data={'grant_type': 'client_credentials'})
r.raise_for_status()
access_token = r.json()["access_token"]

# Access the API with the access token
r = requests.get(
    API_URL + "/people/811EC3ACC0ADCA70",
    headers={'Authorization': 'Bearer ' + access_token})
r.raise_for_status()
print(r.json())
```
