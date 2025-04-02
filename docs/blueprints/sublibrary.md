# Sublibrary

!!! note
    This guide is currently a work in progress.


```mermaid
graph TD
    style sublibrary_bundle fill:#606096,color:#fff

    sublibrary_bundle("Sublibrary Bundle")

    subgraph Ex Libris
        alma_analytics("ALMA Analytics")
        alma_api("ALMA API")
    end

    subgraph University
        person_bundle("Person Bundle")
        organization_bundle("Organization Bundle")
        campusonline("CAMPUSonline")
        ldap("LDAP")
    end

    sublibrary_bundle --> alma_api
    sublibrary_bundle --> alma_analytics
    sublibrary_bundle --> person_bundle
    sublibrary_bundle --> organization_bundle
    organization_bundle --> campusonline
    person_bundle --> ldap
```

## Development Guide Backend

First create an API gateway:

```bash
composer create-project dbp/relay-server-template my-api
cd docker-dev
./build.sh
docker compose up
```

You can access the API at `http://api.localhost:8000`.

Then we need to install the required API bundles:

```bash
composer require dbp/relay-frontend-bundle
composer require dbp/relay-sublibrary-bundle
composer require dbp/relay-base-organization-bundle
composer require dbp/relay-base-organization-connector-campusonline-bundle
composer require dbp/relay-base-person-bundle
composer require dbp/relay-base-person-connector-ldap-bundle
composer require dbp/relay-core-connector-oidc-bundle
composer require dbp/relay-core-connector-ldap-bundle
```

### Configuration

**relay-frontend-bundle:**

The frontend bundle exposes the user roles (i.e. the general permissions the user has) to the frontend.

Give every user the frontend role for managing the library:

```yaml
dbp_relay_frontend:
  roles:
    ROLE_LIBRARY_MANAGER: 'true'
```

**relay-sublibrary-bundle**

The sublibrary bundle is the main bundle that provides the library API.

Fill out the `SUBLIBRARY_*` environment variables in `.env.local`.

in `dbp_relay_sublibrary.yaml`:

```yaml
dbp_relay_sublibrary:
    api_url: '%env(SUBLIBRARY_ALMA_API_URL)%'
    api_key: '%env(SUBLIBRARY_ALMA_API_KEY)%'
    analytics_api_key: '%env(SUBLIBRARY_ALMA_ANALYTICS_API_KEY)%'
    person_local_data_attributes:
        email: email
        alma_id: almaId
    organization_local_data_attributes:
        code: code
    authorization:
        roles:
            ROLE_LIBRARY_MANAGER: 'true'
        attributes:
            SUBLIBRARY_IDS: '["1263"]'
            ALMA_LIBRARY_IDS: '["F2190"]'
```

* Set `ROLE_LIBRARY_MANAGER: 'true'` to allow everyone to access the API
* Fill out `SUBLIBRARY_IDS` with the IDs used by the base organization connector that the user should have access to
* Fill out `ALMA_LIBRARY_IDS` with the ALMA library IDS that the user should have access to
* Set `person_local_data_attributes` to map the attributes that are exposed by the base person connector
* Set `organization_local_data_attributes` to map the attributes that are exposed by the base organization connector

**relay-base-organization-bundle**

The base organization bundle provides the organization API.

No configuration needed.

**relay-base-organization-connector-campusonline-bundle**

This bundle provides the organization entities to the base organization bundle
by deriving them from the CAMPUSonline API.

Fill out the `CAMPUS_ONLINE_*` environment variables in `.env.local`.

Map the organization code to the "code" attribute:

```yaml
dbp_relay_base_organization_connector_campusonline:
  local_data_mapping:
    - local_data_attribute: code
      source_attribute: code
```

We map in the "code" attribute from CAMPUSonline so we can use it in the base organization connector.

**relay-base-person-bundle**

This bundle provides the person API.

No configuration needed.

**relay-base-person-connector-ldap-bundle**

This bundle provides the person entities to the base person bundle by deriving them from LDAP.

Fill out the `LDAP_PERSON_PROVIDER_*` environment variables in `.env.local`.

Map the following LDAP attributes to the local data attributes:

```yaml
dbp_relay_base_person_connector_ldap:
  local_data_mapping:
    - local_data_attribute: email
      source_attribute: mail
    - local_data_attribute: almaId
      source_attribute: co-alma-patron-id
```

We map in the "mail" and "co-alma-patron-id" attributes from LDAP so we can use
them in the sublibrary bundle.

**relay-core-connector-ldap-bundle:**

This bundle provides LDAP connections which can be used by all LDAP bundles.

Fill out the `LDAP_*` environment variables in `.env.local`.
If needed adjust the encryption method in `config/packages/relay_core_connector_ldap.yaml`:

```yaml
dbp_relay_core_connector_ldap:
    connections:
        DEFAULT:
          encryption: 'simple_tls'
```

**relay-core-connector-oidc-bundle:**

This bundle handles token validation and general authentication for the API.

Fill out the `OIDC_*` environment variables in `.env.local`.

### Final Steps & Customization

After everything is configured you can run the health checks to see if everything
is working:

```bash
./bin/console dbp:relay:core:check-health
```

If your library <-> organization mapping is not straight forward because the ID
format is different you can adjust the mapping in PHP code by implementing an
event handler for `SublibraryProviderPostEvent`.

Now you can start the accompanying frontend app.

## Development Guide Frontend

Clone the app, install all dependencies and start the development server:

```bash
git clone https://github.com/digital-blueprint/sublibrary-app
cd sublibrary-app
git submodule update --init
npm install
npm run watch
```
