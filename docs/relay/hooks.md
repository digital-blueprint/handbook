# Bundle Event Hooks

Each of the bundle provides event hooks which you can use to adjust certain
behavior without having to change the bundle code itself.

## Pre/Post Entity Event Hooks

TODO

## Local Data

Local data provides a mechanism to extend resource entities by attributes which are not part of the entities default set of attributes. Local data can be added in custom entity (post-)event subscribers.

### Adding Local Data Attributes to Existing Entities

Integraters have to make sure that local attributes requested by their client applications are added in the backend. This can be done in custom entity (post-)event subscribers:

```php
class EntityEventSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            EntityPostEvent::NAME => 'onPost',
         ];
    }

    public function onPost(EntityPostEvent $event)
    {
        $sourceData = $event->getSourceData();
        $event->trySetLocalDataAttribute('foo', $sourceData->getFoo());
        
        if ($event->isLocalDataAttributeRequested('bar')) {
            $bar = $externalApi->getBar(); // expensive api call
            $event->setLocalDataAttribute('bar', $bar);
        }
    }
}
```
Events of built-in entities provide a `getSourceData()` and a `getEntity()` method by convention, where
* `getSourceData()` provides the full set of available attributes for the entity
* `getEntity()` provides the entity itself

To set local data attributes:
* If you have the attribute value already at hand, call `trySetLocalDataAttribute` . It is safe because it sets the value only if the attribute was requested and not yet set by another event subscriber.
* If getting the attribute value is expensive, call `setLocalDataAttribute` only if `isLocalDataAttributeRequested` is `true`, i.e. if the attribute was actually requested and not yet set.

Note that local data values have to be serializable to JSON.

## Local Data requests

Local data can be requested using the `includeLocal` parameter provided by resource entity GET operations. The format is the following:

```php
includeLocal=<ResourceName>.<attributeName>,...
```

It is a comma-separated list of 0 ... n `<ResourceName>.<attributeName>` pairs, where `ResourceName` is the `shortName` defined in the `ApiResource` annotation of an entity. The list may contain attributes form different resources. 

The backend will return an error if
* The `shortName` of the entity contains `.` or `,` characters 
* The format of the `includeLocal` parameter value is invalid
* Any of the requested attributes was not provided by the backend

The backend will issue a warning if
* The backend tried to set an attribute which was not requested or tried to set a requested attribute multiple times (e.g. by different multiple event subscribers)
