# DateTime/Duration Handling in the API, PHP and Config

Recommendations:

- Persist datetimes as UTC, either with timezone, or without and assume UTC when storing/reading it back.
- Behavior should be independent of the server timezone. For example the API responses should always be UTC.
- When taking datetimes from external systems always ensure that it has a timezone (either fail when it is missing, make the timezone configurable, or set a fixed timezone if it is documented)
- Use `DateTimeImmutable` and `DateTimeInterface` over `DateTime`. All operations on `DateTimeImmutable` create a new instance, which makes mutating objects you don't own impossible.
- Never change the global timezone with `date_default_timezone_set()` except in the very early bootstrap phase of the application and only in code that is always executed.

Open Questions:

- How to handle date times passed from the API clients?
  - Timezone missing? Assume one or fail?
  - Incomplete datetime?
  - Which formats are supported?

## Datetime Handling in the API

With API Platform, when exposing a `DateTimeInterface` property, use the custom
`DateTimeUtcNormalizer` from `Dbp\Relay\CoreBundle\Serializer`:

```php
use ApiPlatform\Metadata\ApiProperty;
use ApiPlatform\Metadata\ApiResource;
use Dbp\Relay\CoreBundle\Serializer\DateTimeUtcNormalizer;
use Symfony\Component\Serializer\Attribute\Context;

#[ApiResource()]
class Foo {

  #[ApiProperty()]
  #[Context([DateTimeUtcNormalizer::CONTEXT_KEY => true])]
  private ?\DateTimeInterface $date = null;
}
```

The normalizer enforces UTC and strict ISO 8601 with an explicit timezone on
both input and output:

- **Normalization** always outputs millisecond precision in UTC, e.g. `2024-01-01T12:00:00.000Z`.
- **Denormalization** accepts ISO 8601 strings with an explicit timezone (`Z` or
  `+HH:MM`), with either millisecond or microsecond precision. The parsed value
  is always converted to UTC. Strings without an explicit timezone are rejected.

The default Symfony DateTimeNormalizer is not strict enough for API use: it
accepts date strings without a timezone, silently interprets them using the
server timezone, and does not enforce a consistent output format.

## Datetime Handling in the Database

Since MariaDB/MySQL's `DATETIME` type doesn't store timezone information, we
assume that all datetimes are stored as UTC. Since Doctrine doesn't have a
built-in UTC type, we provide a custom type that enforces this:

```php
use Dbp\Relay\CoreBundle\Doctrine\DateImmutableUtcType;
use Dbp\Relay\CoreBundle\Doctrine\DateTimeImmutableUtcType;

    public function loadInternal(array $mergedConfig, ContainerBuilder $container): void
    {
        // ...
        $typeDefinition = $container->getParameter('doctrine.dbal.connection_factory.types');
        $typeDefinition['relay_mybundle_datetime_immutable_utc'] = ['class' => DateTimeImmutableUtcType::class];
        $typeDefinition['relay_mybundle_date_immutable_utc'] = ['class' => DateImmutableUtcType::class];
        $container->setParameter('doctrine.dbal.connection_factory.types', $typeDefinition);
        // ...
    }
```

To avoid conflicts the bundle registers the types with a namespace. This custom
type should then be used for the ORM config:

```php
#[ApiProperty]
#[ORM\Column(type: 'relay_mybundle_datetime_immutable_utc', nullable: true)]
private ?\DateTimeInterface $date = null;
```

As well as when using the query builder:

```php
$this->createQueryBuilder('p')
    ->andWhere('p.timeout >= :somedatetime')
    ->setParameter('somedatetime', $somedatetime, 'relay_mybundle_datetime_immutable_utc');
```

## DateTime/Duration Handling in PHP

### How-To UTC in PHP

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

### Durations

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
