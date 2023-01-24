# Overview

[GitLab](https://gitlab.tugraz.at/dbp/check-in/dbp-relay-checkin-bundle) |
[Packagist](https://packagist.org/packages/dbp/relay-checkin-bundle)

This bundle provides an API for interacting with a [Campus QR](https://github.com/studo-app/campus-qr) server. It allows to:

* Query locations
* Check in/out of those locations
* Check in/out external guests of those locations

## Configuration

```yaml
dbp_location_check_in:
  campus_qr_url: '' # The URL to the Campus QR server
  campus_qr_token: '' # The token for accessing the API
```

## Security

To interact with this bundle the user needs to be fully authenticated.

There are two roles that are required for using the provided endpoints:

* `ROLE_SCOPE_LOCATION-CHECK-IN`: Check-in and check-out for the authenticated
  user

* `ROLE_SCOPE_LOCATION-CHECK-IN-GUEST`: Check-in and check-out for external
  guest users. It's recommended to only give this to trusted users to avoid
  bogus check-in/out requests.
