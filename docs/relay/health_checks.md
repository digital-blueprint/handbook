# Health Checks

The relay API gateway provides a command for checking the overall health of the
system as well as all installed bundles. This includes:

* API gateway configuration
* Symfony related configuration
* PHP and server configuration
* Bundle configuration
* Connectivity to various configured external and configured services (external
  APIs, databases, etc.)

Simply run the following in the API server directory:

```
./bin/console dbp:relay:core:check-health
```

If everything is working it should print something like:

```ini
[greenlight-campusonline-connector]
  Check if we can connect to the LDAP server: [SUCCESS]
  Check if the LDAP server contains records: [SUCCESS]
  Check if all configured LDAP attributes exist: [SUCCESS]
  Check if we can connect to the CAMPUSonline API: [SUCCESS]
[core.symfony]
  APP_SECRET should be set: [SUCCESS]
  APP_ENV should be set to 'prod': [SUCCESS]
[core.system]
  Check if DNS is working: [SUCCESS]
  Check if TLS is working: [SUCCESS]
```