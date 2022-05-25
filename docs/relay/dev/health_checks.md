# Health Checks

Each bundle can implement so called health checks, which are short checks which
should tell the user if everything is configured or set up correctly.

They should

* not take too long
* don't alter any state, be non-destructive
* communicate to the user what is wrong if they fail

You can implement them by creating a service that implements the
`CheckInterface` interface.

```php
class HealthCheck implements CheckInterface
{
    public function getName(): string
    {
        return 'example';
    }

    public function check(CheckOptions $options): array
    {
        $ok = new CheckResult('Check that everything is OK');
        $ok->set(CheckResult::STATUS_SUCCESS, 'everything OK');
        return [$ok];
    }
```

For how to invoke them see the [user guide](../debugging.md#health-checks)
