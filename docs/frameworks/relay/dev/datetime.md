# DateTime/Duration Handling in the API, PHP and Config

Recommendations:

* Persist datetimes as UTC, either with timezone, or without and assume UTC when storing/reading it back.
* Behavior should be independent of the server timezone. For example the API responses should always be UTC.
* When taking datetimes from external systems always ensure that it has a timezone (either fail when it is missing, make the timezone configurable, or set a fixed timezone if it is documented)
* Use `DateTimeImmutable` and `DateTimeInterface` over `DateTime`. All operations on `DateTimeImmutable` create a new instance, which makes mutating objects you don't own impossible.
* Set the timezone of the API as soon as possible, and do not switch between different timezones as this could lead to issues.

Open Questions:

* How to handle date times passed from the API clients?
  * Timezone missing? Assume one or fail?
  * Incomplete datetime?
  * Which formats are supported?

## How-To UTC in PHP

Create `DateTimeImmutable` for the current time with a UTC Timezone:

```php
$datetime = new \DateTimeImmutable('now', new \DateTimeZone('UTC'));
```

Create `DateTimeImmutable` for a timestamp with a UTC Timezone:

```php
$datetime = new \DateTimeImmutable('now', new \DateTimeZone('UTC'));
$datetime = $datetime->setTimestamp(1666181371);
```

Convert a `DateTimeImmutable` to an ISO date time string:

```php
$datetime = new \DateTimeImmutable('now', new \DateTimeZone('UTC'));
$string = $datetime->format(DateTime::ATOM);
```

Interpret a date time string without a timezone as UTC:

```php
$datetime = new \DateTimeImmutable('2022-10-20T08:28:49', new \DateTimeZone('UTC'));
```

Convert a `DateTimeImmutable` with a non-UTC timezone to UTC:

```php
$datetime = new \DateTimeImmutable('2022-10-20T08:28:49+02:00');
$datetime->setTimezone(new \DateTimeZone('UTC'));
```

## Durations

Use ISO durations in the config as well as in the API for durations.

If possible use a start and/or end DateTime in the API response, so the client
doesn't have to deal with durations.

Otherwise use ISO 8601 durations, in the bundle config, API and PHP:

```php
new \DateInterval('P1Y');
new \DateInterval('PT60S');
```

Note that the PHP implementation is limited and doesn't allow decimal numbers or
no negative numbers, so we can't support them either.
