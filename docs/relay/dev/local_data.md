# Local Data Aware Entities

To learn how to extend Base Entities using the Local Data mechanism, see [Base Entities](../base_entities.md).

## Creating Local Data aware Entities

You can easily add the Local Data mechanism to your Entity (`MyEntity`) by:

* Using the `LocalDataAwareTrait` in `MyEntity`
* Implementing the `LocalDataAwareInterface` in `MyEntity`
* Adding the `LocalData:output` group to the normalization context of `MyEntity`. For example:
  ```php
   normalizationContext={"groups" = {"MyEntity:output", "LocalData:output"}}
  ```
* Adding an event dispatcher member variable of type `LocalDataAwareEventDispatcher` to your entity provider
* On GET-requests, passing the value of the `includeLocal` parameter to the event dispatcher
```php
$this->eventDispatcher->onNewOperation([$includeParameter]);
```
* Creating a (post-)event `MyEntityPostEvent` extending `LocalDataAwareEvent`, which you pass to the event dispatcher's `dispatch` method once your entity provider is done setting up a new instance of `MyEntity`:
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
$this->eventDispatcher->dispatch($postEvent, MyEntityPostEvent::NAME);

return $myEntity;
```

In case your entity has nested entities (sub-resources), your entity provider is responsible for passing the `includeLocal` parameter to sub-resource providers.
