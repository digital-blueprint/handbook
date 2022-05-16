# Creating Cron Jobs

Each bundle can defined their own cron job commands by creating a service which
implements the `CronJobInterface` interface. The service will be invoked at the
right time by the core bundle.

Note that the jobs might be called more often then specified in some edge cases
and failed jobs will not be retried.

```yaml
  Dbp\Relay\MyBundle\Cron\MyCronJob:
    autowire: true
    autoconfigure: true
```

```php
class MyCronJob implements CronJobInterface
{
    public function getName(): string
    {
        return 'My Cron Job';
    }

    public function getInterval(): string
    {
        // Every hour
        return '0 * * * *';
    }

    public function run(CronOptions $options): void
    {
        // Do things here...
    }
}
```
