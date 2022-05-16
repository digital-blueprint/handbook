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
php /srv/api/bin/console dbp:relay:core:queue:work my-worker-01
```

See ['Queued Tasks'](./queue.md) for a recommended supervisor
configuration.

### Disabling Debug Mode and setting an App Secret

By default debugging and the development configuration is enabled which is not
suitable for production use (security leaks and performance issues). In addition
you need to set `APP_SECRET` which is used to add entropy to various things and
encrypt cookies etc. You need to make sure that that the following is set in
your `.env.local`:

```ini
# https://symfony.com/doc/current/configuration.html#selecting-the-active-environment
APP_ENV=prod
# https://symfony.com/doc/current/reference/configuration/framework.html#secret
APP_SECRET=<some-random-string>
```

You can generate a suitable random string via

```bash
php -r 'echo bin2hex(random_bytes(20))."\n";'
```

### On Every Deployment

* `composer install --no-dev --classmap-authoritative` to install only non-dev dependencies and optimize the class loader for static sources.

* `composer dump-env prod` to write out a `.env.local.php` file constructed from the `.env` file and the `.env.local` file. This avoids parsing the `.env` files in the future.

* `php bin/console cache:clear` to clear the cache and warm it up again

* (optional) `php bin/console dbp:relay:core:queue:restart` in case you have
   workers running (via supervisor) they need to be stopped, so the next task
   they execute uses the newly deployed code.

* (optional) Use [cachetool](https://github.com/gordalina/cachetool) to clear
  the opcache. This is required if you use php-fpm and don't restart it between
  deployments.