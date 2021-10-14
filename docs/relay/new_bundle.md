# Creating a New Bundle

For best practices on how to create a Symfony bundle see https://symfony.com/doc/current/bundles/best_practices.html

The easiest way to create a new bundle is to copy the "API Starter Bundle", use
it as a starting point, and adjust it to your needs.

For a new bundle you need three new names and need to adjust them everywhere in the bundle:

* A name for your composer package e.g. `dbp/api-starter-bundle`
* A PHP namespace for your code e.g. `DBP\\API\\StarterBundle\\`
* PHP bundle name e.g. `DbpStarter`

To be more specific, you need to:

* Create a copy of https://gitlab.tugraz.at/dbp/middleware/dbp-api/api-starter-bundle
* Rename `name` in composer.json
* Adjust the autoload paths in composer.json to the new PHP namespace
* Rename the PHP namespace in every file (`.php` and `.yaml`)
* Rename `DbpStarterBundle.php` and the class to `MyCustomBundle.php` for example
* Rename `DependencyInjection/DbpStarterExtension.php` and the class to `MyCustomExtension.php` for example
* Make sure `composer install`, `composer test` and `composer lint` all work to make sure you haven't missed anything.

The config key gets automatically derived from the bundle name by converting to
lower case separated by `"_"`: `DbpStarter` -> `dbp_starter`

After this is done you can integrate this new bundle into your Symfony application (the "API Server Template" for example):

In the composer.json of your server add the git repo of the new bundle:

```json
    "repositories": [
        {
            "type": "vcs",
            "url": "https://gitlab.tugraz.at/dbp/middleware/dbp-api/api-custom-bundle.git"
        },
    ]
```

* Add the package as a dependency, using the latest git version of the "main" branch:

`composer require dbp/my-custom-bundle=dev-main`

* Add the bundle to your `config/bundles.php`:

Make sure your bundle is added in front of `DBP\API\CoreBundle\DbpCoreBundle`.

```php
...
DBP\API\MyCustomBundle\MyCustomBundle::class => ['all' => true],
DBP\API\CoreBundle\DbpCoreBundle::class => ['all' => true],
];
```

* Run composer to clear caches

`composer install`

After this the bundle is integrated into your Symfony server and all services it
provides as REST APIs or CLI commands are available in the Symfony application.
Run docker-compose to see it in action.
