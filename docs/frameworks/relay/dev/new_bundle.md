# Creating a New Bundle

The easiest way to start a new bundle is by using our bundle creator.
The API server comes with a command which creates a new bundle according to your specified 
naming and installs/registers it with your application, so you can start developing/testing right away.

Execute this command in the console in the directory of the api. Note that the `relay` prefix and the 
`bundle` suffix are added automatically to the bundle name:

```console
> ./bin/console dbp:relay:maker:make:bundle \
    --vendor myuni \
    --unique-name=example \
    --friendly-name="Example Bundle" \
    --example-entity=Entity

    Composer Package Name: myuni/relay-example-bundle
            PHP Namespace: Myuni\Relay\ExampleBundle
      Symfony Bundle Name: MyuniRelayExampleBundle
        Bundle Config Key: myuni_relay_example
           PHP Class Name: Resource
  API-Platform Short Name: ExampleResource
            Resource Path: /example/resources
      Serialization Group: ExampleResource:some-group
             Open API Tag: Example Bundle
      GIT Repository Name: myuni-relay-example-bundle
Continue? (y/n)

* The package 'myuni/relay-my-bundle-bundle' was created under 'bundles/myuni-relay-my-bundle'
* The package was added to your composer.json and installed
* The containing bundle was registered with your application
```

This will create a new composer package under `./bundles`, register it in your `composer.json` and register the containing bundle in your `bundles.php`. After restarting the server you will see example API endpoints added by the bundle.

## Publishing your Bundle

Ideally at some point in the future you will want to share your bundle publicly, so other users can install and benefit from it as well. For this you need to

* Extract the bundle directory into its own git repository (see https://docs.github.com/en/get-started/using-git/splitting-a-subfolder-out-into-a-new-repository for example, in case you want to preserve the history)
* Publish the new package to https://packagist.org/
* Remove the local repository in your `composer.json` under `repositories`, so the package is installed from packagist.

If you just want to extract the package, but don't want to publish it publicly you can also install from a private git repository instead. See https://getcomposer.org/doc/05-repositories.md#vcs for more information.

## Further Information

* For best practices on how to create a Symfony bundle see
https://symfony.com/doc/current/bundles/best_practices.html
* The new bundle is based on our bundle template, see https://github.com/digital-blueprint/relay-template-bundle for more information
* If you want to look at a more fully featured bundle as a reference see https://github.com/digital-blueprint/relay-example-bundle which contains various examples of what you can do and implement inside of a bundle.
