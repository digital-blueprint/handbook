# Base Entities

Base Entities are basic resource entities intended to be (re-)usable in a wide range of applications and environments. They have a minimal set of core attributes and can easily be extended to fit the needs of a particular application.

The Relay API Gateway provides a growing set of Base Entities, such as

* [Base Organization](bundles/base-organization/index.md)
* [Base Person](bundles/base-person/index.md)

## Bundle Structure

### Base Entity Bundles

Base Entities have a corresponding bundle where they are defined (e.g. the [Base Organization Bundle](bundles/base-organization/index.md)). These Base Entity Bundles define

* the Base Entity
* HTTP endpoints to request the Base Entity (at least one item and one collection endpoint)
* the Base Entity Provider Interface, which declares Base Entity access methods (at least one getter for an item and for a collection)

### Base Entity Connector Bundles

The Base Entity Provider Interface is usually implemented in a so-called Base Entity Connector Bundle retrieving Base Entity data from a backend system, such as a local database, the CAMPUSOnline API, LDAP, or other sources.

There may exist multiple Connector Bundles (Provider Interface implementations) per Base Entity, but only one per installation.

## How to Extend Base Entities

Base Entities may lack some attributes required by your business logic. _Local Data_ provides a mechanism to extend Base Entities by attributes which are not part of the core attributes.

### Adding Local Data Attributes to Existing Entities

Local data can be added in custom Base Entity (post) event hooks:

```php
class EntityPostEventSubscriber implements EventSubscriberInterface
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
Events of Base Entities from the Relay API Gateway provide a `getSourceData()` and a `getEntity()` method by convention, where

* `getSourceData()` provides the full set of available attributes for the entity
* `getEntity()` provides the entity itself

To set local data attributes:

* If you have the attribute value already at hand, call `trySetLocalDataAttribute` . It is safe because it sets the value only if the attribute was requested and not yet set by another event subscriber.
* If getting the attribute value is expensive, call `setLocalDataAttribute` only if `isLocalDataAttributeRequested` is `true`, i.e. if the attribute was actually requested and not yet set.

Note that local data values have to be serializable to JSON.

To learn how to add the Local Data mechanism to your own Entity, see [Local Data Aware Entities](dev/local_data.md).

### Local Data requests

Local data can be requested by clients using the `includeLocal` parameter provided by Base Entity GET operations. Its value is a comma-separated list of attribute names:

```php
includeLocal=<attributeName>,...
```

The server will return a client error if

* The format of the `includeLocal` parameter value is invalid
* A requested attribute could not be provided by any event hook

The server will issue a warning if

* Multiple event hooks tried to set the same requested attribute

### Using Local Query Parameters

Base Entities usually provide basic filtering by their core attributes. In a similar way as Local Data attributes do with the output, Local Query parameters provide a mechanism to add custom input to a query. 

These Local Query parameters are passed directly to the backend system (i.e. the provider interface implementation) by default. Alternatively, they can be modified (e.g. mapped) by a custom Base Entity (pre) event hook:  
```php
class EntityPreEventSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            EntityPreEvent::NAME => 'onPre',
         ];
    }

    public function onPre(EntityPreEvent $event)
    {
        $localQueryParameterOut = [];
        // get the query parameters by the client
        $localQueryParameterIn = $event->getQueryParameters();
        // do some mapping 
        $localQueryParameterOut['student'] = $localQueryParameterIn['person'] ?? '';
        // set the query parameters for the backend
        $event->setQueryParameters($localQueryParameterOut);
    }
}

```

Local Query parameters can be specified by clients using the `queryLocal` parameter provided by Base Entity GET operations. The format of the `queryLocal` parameter is a comma-seperated list of  `<parameter key>:<parameter value>` pairs:

```php
queryLocal=<parameterName>:<parameterValue>,...
```

The server will return a client error if

* The format of the `queryLocal` parameter value is invalid


