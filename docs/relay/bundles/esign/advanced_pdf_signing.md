# Advanced Signature Example

The following Python example shows how to attach an advanced signature
(Amtssignatur for example) to a PDF file.

1. Fetch an access token from Keycloak
2. Upload the PDF
3. Extract the signed PDF from the response

```python
import os
from urllib.request import urlopen

import requests
from pyld import jsonld

KEYCLOAK_URL = "https://auth.tugraz.at/auth"
API_URL = "https://api.tugraz.at"
PDF_IN_PATH = 'example.pdf'

# Credentials
CLIENT_ID="<keycloak-client-id>"
CLIENT_SECRET="<keycloak-client-secret>"

# Fetch a token pair
TOKEN_URL = KEYCLOAK_URL + "/realms/tugraz/protocol/openid-connect/token"
r = requests.post(
    TOKEN_URL, auth=(CLIENT_ID, CLIENT_SECRET),
    data={'grant_type': 'client_credentials'})
r.raise_for_status()
access_token = r.json()["access_token"]

# Make a signing request
with open(PDF_IN_PATH, 'rb') as h:
    r = requests.post(
        API_URL + "/esign/advancedly_signed_documents",
        headers={'Authorization': 'Bearer ' + access_token},
        params={"profile": "sap"},
        files={'file': (PDF_IN_PATH, h)})
    r.raise_for_status()

# Normalize the response
context = {
    'contentSize': 'https://schema.org/contentSize',
    'contentUrl': 'http://schema.org/contentUrl',
    'name': 'http://schema.org/name',
}
response = jsonld.compact(r.json(), context)

# Write the signed data to a file
with urlopen(response["contentUrl"]) as h:
    out_path = os.path.basename(response["name"])
    with open(out_path, 'wb') as wh:
        wh.write(h.read())
```