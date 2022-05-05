# Creating a New Bundle

The easiest way to create a new bundle is by using our bundle creator.

If you want to create a DBP Symfony bundle in a subdirectory of the current folder you can call:

```bash
npx @digital-blueprint/cli generate-bundle --unique-name=my-bundle --friendly-name="My Bundle" --example-entity=Entity
```

This will create a new a directory called `relay-my-bundle-bundle` containing a
Symfony bundle that is ready to go. We recommend that you make this a git
repository and push it to a git server:

* `git init .`
* `git checkout -b main`
* `git add .`
* `git commit [...]`
* `git push [...]`

The next step is to integrate the bundle into your Symfony application. You can
either publish your package to https://packagist.org or register your git repo
with your Symfony app by adding it to your composer.json:

```json
    "repositories": [
        {
            "type": "vcs",
            "url": "https://gitlab.tugraz.at/dbp/relay/my-custom-bundle.git"
        },
    ]
```


Then you can install your bundle just like every other package:

`composer require dbp/my-custom-bundle=dev-main`

Now you can continue developing your bundle for example by pointing your IDE to
`vendor/dbp/my-custom-bundle`.

Note that in many cases Symfony cashes various things so changes to the bundle
code won't have any effect on the application. You can clear the cache via

```bash
./bin/console cache:clear
```

## Further Information

* For best practices on how to create a Symfony bundle see
https://symfony.com/doc/current/bundles/best_practices.html
* For details on the `@digital-blueprint/cli` tool see https://gitlab.tugraz.at/dbp/cli
* For details on the bundle template see https://gitlab.tugraz.at/dbp/relay/dbp-relay-template-bundle
* If you want an example implementation of a relay-api bundle with an entity, a command and some services see https://gitlab.tugraz.at/dbp/relay/dbp-relay-example-bundle
