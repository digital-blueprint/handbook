# Locks

Locks are used to provide exclusive access to a shared resource.

The Relay API gateway optionally requires a locking backend. By default it uses
a local backend which is only suitable if all processes run on the same server.
Once your API runs on multiple servers you need to configure a remote/shared
locking backend.

## Configuration

In the bundle configuration set the `lock_dsn` key to a DSN supported by the
[Symfony Lock component](https://symfony.com/doc/current/components/lock.html)

At the moment we only support RedisStore and PdoStore:

### Redis

```yaml
# config/packages/dbp_relay_core.yaml
dbp_relay_core:
  # redis[s]://[pass@][ip|host|socket[:port]]
  lock_dsn: 'redis://localhost:6379'
```

### PDO

```yaml
# config/packages/dbp_relay_core.yaml
dbp_relay_core:
  lock_dsn: 'mysql://user:secret@mariadb:3306/dbname'
```

This will create a `lock_keys` table in your database where the lock information
will be stored.

!!! warning "Keep your secrets in the .env.local file"

    To provide easier maintainability for your project it is recommended to keep all secrets in the .env.local file. In this case, you could add a variable LOCK_DSN='mysql://user:secret@mariadb:3306/dbname' to your .env.local file, and reference it using lock_dsn: '%env(LOCK_DSN)%'
