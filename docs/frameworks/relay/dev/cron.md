# Cron Jobs

Each bundle can defined their own cron job commands by creating a service which
implements the `CronJobInterface` interface. The service will be invoked at the
right time by the core bundle.

Note that the jobs might be called more often then specified in some edge cases
and failed jobs will not be retried.

`src/Resources/config/services.yaml`:

```yaml
  Dbp\Relay\MyBundle\Cron\MyCronJob:
    autowire: true
    autoconfigure: true
```

`src/Cron/MyCronJob.php`:

```php
<?php

declare(strict_types=1);

namespace Dbp\Relay\MyBundle\Cron;

use Dbp\Relay\CoreBundle\Cron\CronJobInterface;
use Dbp\Relay\CoreBundle\Cron\CronOptions;

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

See https://crontab.guru/ for information on the syntax used in the interval
string.


## FAQ

**What happens if a job fails/throws?**

The error will be logged, and the next job will be executed, if there is one ready. The same job will be executed again later according to the cron interval.

**What happens if my job takes longer then the configured interval?**

Then multiple instances of your job will run at the same time.
