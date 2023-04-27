# Bundle Configuration

Assuming you have a bundle which provides an API for a backend service there are multiple things you want the integrator to specify:

* API URLs of backend systems
* Secrets for backend systems
* Configuration for which storage to use
* Configuration for which cache/lock/message bus backend to use
* Or if all that isn't enough, PHP code for communicating with a completely custom backend

The [API Example Bundle](https://packagist.org/packages/dbp/relay-example-bundle) contains examples for both variants explained here.

## Symfony Bundle Configuration (Simple)

See https://symfony.com/doc/current/bundles/configuration.html for details.

This is most useful for configuring API URLs, secrets, and other semi-static things.

You need to:

* Add a `Configuration` class to your bundle
* Specify the configuration schema in it
* Add a `my_bundle.yaml` under `config/packages` in your Symfony app which contains static strings, or references environment variables so the deployment can set different values via an `.env.local` file

The yaml file will the look something like:

```yaml
dbp_mybundle:
  backend:
    something: 42
    server_url: '%env(BACKEND_URL)%'
    client_id: '%env(BACKEND_CLIENT_ID)%'
    client_secret: '%env(BACKEND_CLIENT_SECRET)%'
```

The `.env` file contains something like:

```ini
# Backend Config
BACKEND_URL=https://backend.example.com/api
KEYCLOAK_REALM=myrealm
BACKEND_CLIENT_ID=my-client-id
BACKEND_CLIENT_SECRET=
```

And in your `.env.local` which should never be committed to git you can specify your secrets:

```ini
BACKEND_CLIENT_SECRET=topsecret
```

## Symfony Service Overrides (Complex)

There are multiple things an integrator can change for an existing bundle from the outside without changing anything in the bundle itself: https://symfony.com/doc/current/bundles/override.html

In our bundles we've focused on the following strategy to allow users to inject their PHP code into the bundle logic, in case a static config isn't enough:

* The bundle provides a public PHP API with one or more interfaces.
* By default the bundle uses a "dummy" implementation of those interfaces. For example an interface which returns a hardcoded set of resources just for testing.
* The integrator can implement the interface outside of the bundle and
  replace the dummy implementation.

Assuming we have a bundle that can store images to some backend and the integrator wants to integrate this with their own backend system.
The bundle provides a `ImageStorageInterface` and the integrator implements it and wires it up with the real backend. Then the bundle will use the integrator provided code and pass the image data to this new implementation.

Implementation:

```php
use DBP\API\ImageBundle\API\ImageStorageInterface;

class MyImageStorage implements ImageStorageInterface
{
    ...
}
```

Replace dummy service via `services.yaml`:

```yaml
  DBP\API\ImageBundle\API\ImageStorageInterface:
    '@DBP\App\Service\MyImageStorage'
```

While this allows for greater flexibility it also makes it harder for the integrator to get things up and running. An alternative to the above approach would be if the bundle contained various implementations for existing storage backends already and the integrator would just specify which one to use:

```yaml
dbp_mybundle:
  backend_type: 'imagestore2000'
  backend_url: 'https://images.exmaple.com/api'
```
