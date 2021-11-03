# Running in Production

When moving your API into production some extra steps have to be taken:

### Initial Server Setup

For handling asynchronous and background tasks we need to set up a cron entry
for regular cleanup as well as supervisor for handling queued tasks.

Set up the following cron job to be executed every 5 minutes:

```
*/5 * * * * php /srv/api/bin/console dbp:relay:core:cron
```

Set up the following supervisor job which runs continuously in the background
handling various tasks:

```
php /srv/api/bin/console messenger:consume async --time-limit=3600
```

See https://symfony.com/doc/current/messenger.html#supervisor-configuration for
a recommended supervisor configuration.

### On Every Deployment

* `composer install --no-dev --classmap-authoritative` to install only non-dev dependencies and optimize the class loader for static sources.

* `composer dump-env prod` to write out a `.env.local.php` file constructed from the `.env` file and the `.env.local` file. This avoids parsing the `.env` files in the future.

* `php bin/console cache:clear` to clear the cache and warm it up again

* (optional) `php bin/console messenger:stop-workers` in case you have workers
   running (via supervisor) they need to be stopped, so the next task they
   execute uses the newly deployed code.

* (optional) Use [cachetool](https://github.com/gordalina/cachetool) to clear
  the opcache. This is required if you use php-fpm and don't restart it between
  deployments.