# Debugging

## Health Checks

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

## Logs

The logging configuration is stored under `config/packages/prod/monolog.yaml`. It defaults to storing the logs with a level higher than "info" for 10 days (for privacy reasons) under `var/log`.

## Debug Mode

!!! warning "Never enable debug mode in production!"

    Debug mode allows users to access all configuration including all secrets. Never enable it in production!

By enabling the `dev` environment via `APP_ENV=dev` you can active the debug mode in Symfony.
This will:

* Enable the Symfony debug toolbar which is visible at the bottom of the API documentation page.
  It gives access to all the recent API requests, including logs, warnings, and context, timing information and much more.
* Enable richer error messages. Unhandled API errors will include a stack trace, including the content of variables on the stack at the time of the error.

## Re-creating the Symfony Cache

In some cases a corrupt or out-of-date Symfony cache can lead to hard to debug errors or to behaviour that doesn't match the current source code. It's a good idea to clear the Symfony cache to rule out any problems in that area, either by manually deleting `var/cache` or by calling `./bin/console cache:clear`.
