# Local Data Aware Entities

To learn how to extend Base Entities using the Local Data mechanism, see [Base Entities](./base_entities.md).

## Adding Local Data to your Entity Bundle's Configuration

To let admins configure which local data attributes are available for your entity (`MyEntity`) and how is allowed to request them you 
first add the local data configuration node definition to your entity (`MyEntity`) bundle's configuration tree:

```php
public function getConfigTreeBuilder(): TreeBuilder
{
    $treeBuilder = new TreeBuilder('my_vendor_my_entity');
    $treeBuilder->getRootNode()->append(LocalData::getConfigNodeDefinition());
     // ...

    return $treeBuilder;
}
```
and set the config in your entity's data provider `MyEntityDataProvider` (extending `AbstractDataProvider`) on container load:

```php
public function loadInternal(array $mergedConfig, ContainerBuilder $container): void
{
    $container->getDefinition(MyEntityDataProvider::class)
        ->addMethodCall('setConfig', [$mergedConfig]);
}
````

Now local data attributes can be configured in your entity bundle's config 
(like when [Adding Local Data Attributes to Existing Entities](./base_entities.md#adding-local-data-attributes-to-existing-entities):

```yaml
my_vendor_my_entity:
    local_data:
      - local_data_attribute: foo
        read_policy: 'user.get("MAY_READ_FOO")'
```
Local data attribute `foo` can now be requested on `MyEntity`. If `MAY_READ_FOO` evaluates to `false` for the logged-in user,
the local data attributes value will be `null` (see [Access Control](../admin/access_control.md) for details on access control policies).

## Make your Entity Local Data Aware

You can easily add the Local Data mechanism to `MyEntity` by:

* Using the `LocalDataAwareTrait` in `MyEntity`
* Implementing the `LocalDataAwareInterface` in `MyEntity`
* Adding the `LocalData:output` group to the normalization context of `MyEntity`. For example:
  ```php
  normalizationContext: [
        'groups' => ['MyEntity:output', 'LocalData:output'],
    ]
  ```
* Adding an event dispatcher member variable of type `LocalDataAwareEventDispatcher` to your entity provider
* On GET-requests, passing the `options` containing the local data attributes option to the event dispatcher
   * NOTE: if your data provider extends `AbstractDataProvider` (recommended), then the `options` passed to overrides of `getItemById` and `getPage`
already contain the local data attributes option):
```php
$this->eventDispatcher->onNewOperation($options);
```
* Creating a (post-)event `MyEntityPostEvent` extending `LocalDataPostEvent`, which you pass to the event dispatcher's `dispatch` method,
once your entity provider is done setting up a new instance of `MyEntity`:
```php
// get some data
$mySourceData = $externalApi->getSourceData($identifier);

// craete a new instance of MyEntity
$myEntity = new MyEntity();
// first, set the entity's default attributes:
$myEntity->setIdentifier($mySourceData->getIdentifier());
$myEntity->setName($mySourceData->getName());

// now, fire the event allowing event subscribers to add local data attributes
$postEvent = new MyEntityPostEvent($myEntity, $mySourceData);
$this->eventDispatcher->dispatch($postEvent);

return $myEntity;
```

In the next chapter, we show how to create event subscribers which set local data attributes on your entity.

## Creating Local Data Event Subscribers

Adding local data attributes to entities is explained in [Adding Local Data Attributes to Existing Entities](./base_entities.md#adding-local-data-attributes-to-existing-entities). 

However, in your connector bundle, you might want to offer local data attributes that your respective backend system provides.
For this, you can extend the `AbstractLocalDataEventSubscriber` and tell it to handle your entity's post event:

```php
final class MyEntityLocalDataEventSubscriber extends AbstractLocalDataEventSubscriber
{
    public static function getSubscribedEvents(): array
    {
        return [
            MyEntityPostEvent::class => 'onPost',
         ];
    }
}
```

Append the subscriber's config node definition to your connector bundle's configuration tree:

```php
public function getConfigTreeBuilder(): TreeBuilder
{
    $treeBuilder = new TreeBuilder('my_vendor_my_entity_connector_source_system');
    $treeBuilder->getRootNode()->append(MyEntityLocalDataEventSubscriber::getLocalDataMappingConfigNodeDefinition());
    // ...
    return $treeBuilder;
}
```

And set the configuration in your event subscriber on container load:

```php
public function loadInternal(array $mergedConfig, ContainerBuilder $container): void
{
    $container->getDefinition(MyEntityLocalDataEventSubscriber::class)
        ->addMethodCall('setConfig', [$mergedConfig]);
    // ...
}
```

Now the mapping between local data attributes and source data attributes can be configured in your connector bundle's config
(see [Local Data Mapping Config](./base_entities.md/#local-data-mapping-config)):

```yaml
my_vendor_my_entity_connector_source_system:
    local_data_mapping:
        - local_data_attribute: foo
          source_attribute: foo_source
```
Note that local data attribute `foo` will only be available if it is also configured in the entity bundle's config
(see [Adding Local Data to your Entity Bundle's Configuration](./local_data.md/#adding-local-data-to-your-entity-bundles-configuration)).