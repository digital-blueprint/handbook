# Greenlight Connector Bundle for CampusOnline and LDAP

The [Greenlight Connector CampusOnline Bundle](https://gitlab.tugraz.at/dbp/greenlight/dbp-relay-greenlight-connector-campusonline-bundle)
fetches images for [DbpRelayGreenlightBundle](https://gitlab.tugraz.at/dbp/greenlight/dbp-relay-greenlight-bundle)
from CampusOnline, while retrieving the `co-obfuscated-c-ident` from LDAP.

## Installation

!!! warning "Important"

    Make sure you are using the [API Server Template](https://gitlab.tugraz.at/dbp/relay/dbp-relay-server-template) as
    template Symfony application or have added the [dbp Symfony recipe repository](https://github.com/digital-blueprint/symfony-recipes)
    to your application to get the configuration file and environment variables installed automatically.


```bash
# Install the bundle
composer require dbp/relay-greenlight-connector-campusonline-bundle
```

## Configuration

Adapt all `GREENLIGHT_CONNECTOR_CAMPUSONLINE_` settings in your `.env`.

```bash
GREENLIGHT_CONNECTOR_CAMPUSONLINE_API_URL=https://campusonline.your.domain
GREENLIGHT_CONNECTOR_CAMPUSONLINE_CLIENT_ID=client-id
GREENLIGHT_CONNECTOR_CAMPUSONLINE_CLIENT_SECRET=secret
GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_HOST=directory.your.domain
GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_BASE_DN=ou=users,o=uni
GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_USERNAME=cn=your_api,o=uni
GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_PASSWORD=secret
GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_IDENTIFIER_ATTRIBUTE=cn
GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_CO_IDENT_NR_OBFUSCATED_ATTRIBUTE=co-obfuscated-c-ident
```

!!! tip

    Consider putting the `GREENLIGHT_CONNECTOR_CAMPUSONLINE_CLIENT_ID`, `GREENLIGHT_CONNECTOR_CAMPUSONLINE_CLIENT_SECRET`
    and `GREENLIGHT_CONNECTOR_CAMPUSONLINE_LDAP_PASSWORD` in your `.env.local` file, because of the secret information.


## Customization

This bundle registers an event before and after a photo for a user is fetched from CampusOnline to be able to modify
the user id that is used to fetch a photo and to modify the photo that is fetched.

Please see [DbpRelayGreenlightConnectorCampusonlineBundle Events](https://gitlab.tugraz.at/dbp/greenlight/dbp-relay-greenlight-connector-campusonline-bundle#events)
for more information.
