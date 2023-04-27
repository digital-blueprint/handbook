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

    Debug mode allows clients to freely access all configuration, including all secrets. Never enable it on a publicly accessible server!

The debug mode is helpful if the API or a web page just returns a generic unhelpful error message and the information in the logs is either missing or not helpful enough.

By enabling the debug mode you get:

* Richer error messages. Unhandled API errors will include a stack trace, including the content of variables on the stack at the time of the error. Web pages served by Symfony will also include stack traces in the HTML output and more detailed error messages.
* The Symfony debug toolbar which is visible at the bottom of each website, like the API documentation page. It gives access to all the recent API requests, including logs, warnings, and context, timing information and much more.

You can enable the debug mode by adding `APP_DEBUG=1` to your `.env` file. Note that the `dev` environment, selected via `APP_ENV=dev`, automatically enables this debug mode.

## Re-creating the Symfony Cache

In some cases a corrupt or out-of-date Symfony cache can lead to hard to debug errors or to behaviour that doesn't match the current source code. It's a good idea to clear the Symfony cache to rule out any problems in that area, either by manually deleting `var/cache` or by calling `./bin/console cache:clear`.
