# Database Handling

At the moment there are no good general best practices for how to integrate
database support into your bundle. Consider looking at one of the existing
bundles that require a database for how to set things up.

## General Rules

* Each bundle should provide the possibility to use its own separate database.
* Each bundle should support sharing a database with all other bundles.
* All database tables need to be prefixed with the bundle unique name .e.g `uniquename_tablename`

## Registering a Doctrine Entity Manager

Use `registerEntityManager()` to register your entity manager with the core bundle. This, among other things, will integrate your bundle with the global database migration command (`dbp:relay:core:migrate`).

```php
// In *Extension.php, using the ExtensionTrait
public function prepend(ContainerBuilder $container)
{
    $this->registerEntityManager($container, 'dbp_relay_myname_bundle');
    // ...
```
