# Base Entities

Base Entities are basic resource entities intended to be (re-)usable in a wide range of applications and environments. They have a minimal set of core attributes and can easily be extended to fit the needs of a particular application.

The Relay API Gateway provides a growing set of Base Entities, such as

* [Base Organization](../../../components/api/base-organization/index.md)
* [Base Person](../../../components/api/base-person/README.md)

## Bundle Structure

### Base Entity Bundles

Base Entities have a corresponding bundle where they are defined (e.g. the [Base Organization Bundle](../../../components/api/base-organization/index.md)). These Base Entity Bundles define

* the Base Entity
* HTTP endpoints to request the Base Entity (at least one item and one collection endpoint)
* the Base Entity Provider Interface, which declares Base Entity access methods (at least one getter for an item and for a collection)

### Base Entity Connector Bundles

The Base Entity Provider Interface is usually implemented in a so-called Base Entity Connector Bundle retrieving Base Entity data from a backend system, such as a local database, the CAMPUSOnline API, LDAP, or other sources.

There may exist multiple Connector Bundles (Provider Interface implementations) per Base Entity, but only one per installation.

## How to Extend Base Entities

Base Entities may lack some attributes required by your business logic. _Local Data_ provides a mechanism to extend Base Entities by attributes which are not part of the core attributes.

### Adding Local Data Attributes to Existing Entities

To be able to request a new Local Data attribute, you need to add an entry to the ```local_data``` node
of the Base Entity's bundle config:

```yaml
dbp_relay_base_person:
  local_data:
    - local_data_attribute: foo
      authorization_expression: 'user.get("MAY_READ_FOO")'
    - local_data_attribute: bar
      authorization_expression: 'true'
```

The ```authorization_expression``` represents a conditional statement determining which users are authorized to read the attribute.
With the example config above, users with the ```MAY_READ_FOO``` attribute may request the ```foo``` attribute and 
all users may request the ```bar``` attribute of a person.  See [Access Control Policies](../admin/access_control.md#access-control-policies) to 
learn how to write these expressions. 

To add Local data to an entity you can write a custom Base Entity post event subscriber listening to the post event of 
the base entity, which is triggered after the entity data is retrieved from the backend:

```php
class PersonPostEventSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PersonPostEvent::class => 'onPost',
         ];
    }

    public function onPostEvent(PersonPostEvent $event)
    {
        $sourceData = $event->getSourceData();
        $event->trySetLocalDataAttribute('foo', $sourceData['foo']);
        
        if ($event->isLocalDataAttributeRequested('bar')) {
            $bar = $externalApi->getBar(); // expensive api call
            $event->setLocalDataAttribute('bar', $bar);
        }
    }
}
```
Base Entity post events in the Relay API Gateway are derived from ```LocalDataPostEvent``` and provide a `getSourceData()` and a `getEntity()` method by convention,
where

* `getSourceData()` provides the full set of available attributes for the entity.
* `getEntity()` provides the entity itself.

To set local data attributes:

* If you have the attribute value already at hand, call `trySetLocalDataAttribute` . It is safe because it sets the value only if the attribute was requested and not yet set by another event subscriber.
* If getting the attribute value is expensive, call `setLocalDataAttribute` only if `isLocalDataAttributeRequested` is `true`, i.e. if the attribute was actually requested and not yet set.

Note that local data values have to be serializable to JSON.

To learn how to add the Local Data mechanism to your own entity, see [Local Data Aware Entities](./local_data.md).

### Local Data Mapping Config

[Base Entity Connector Bundles](#base-entity-connector-bundles) in the Relay API Gateway ship with a built-in Base Entity event subscriber
(derived from ```LocalDataEventSubscriber```). It can be used by configuring the ```local_data_mapping``` node
in the connector's bundle config:

```yaml
dbp_relay_base_person_connector_ldap:
  local_data_mapping:
    - local_data_attribute: foo
      source_attribute: foo_source
    - local_data_attribute: fooList
      source_attribute: foo_source
      is_array: true # default: false
```

The example config above maps the source data attribute ```foo_source``` to the Local Data attribute ```foo```. If
source attribute is not available ```null``` is returned. The attribute ```fooList``` is configured to be an array,
which means that the value of the source attribute is converted to a single-element array if it has a scalar value.
Conversely, if the attribute is not configured to be an array (which is the default) and the source attribute value
is of type array, the first array element is returned.

### Local Data requests

Local data can be requested by clients using the `includeLocal` parameter provided by Base Entity GET operations.
Its value is a comma-separated list of attribute names:

```php
includeLocal=<attributeName>,...
```

The server will return a client error if

* The format of the `includeLocal` parameter value is invalid.
* A requested attribute could not be provided by any event subscriber.

The server will issue a warning if

* Multiple event subscribers tried to set the same requested attribute.

### Using Local Query Parameters

Base Entities usually provide basic filtering by their core attributes. Local Query parameters provide a mechanism to 
query by Local Data attributes for a specific connector backend which provides the data (LDAP, DB, ...).

To be able to query by a Local Data attribute, the ```allow_query``` option of the attribute must be set to ```true```
in the ```local_data``` config of the Base Entity's bundle config:

```yaml
dbp_relay_base_person:
  local_data:
    - local_data_attribute: foo
      authorization_expression: 'user.get("MAY_READ_FOO")'
      allow_query: true
``` 

Local Queries can be 'injected' by modifying the options passed to the connector backend. You can do this by writing a
custom Base Entity pre event subscriber, listening to the pre event of the base entity , which is triggered before
the query is executed:

```php
class PersonPreEventSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PersonPreEvent::class => 'onPreEvent',
         ];
    }

    public function onPreEvent(PersonPreEvent $preEvent)
    {
        $value = null;
        if ($preEvent->tryPopPendingQueryParameter('foo', $value)) {
            $options = $preEvent->getOptions();

            $options['filter'] = [
                'attribute' => 'foo',
                'value' => $value,
            ];

            $preEvent->setOptions($options);
        }
    }
}

```

Base Entity pre events in the Relay API Gateway are derived from ```LocalDataPreEvent``` and provide the
following methods:

* ```tryPopPendingQueryParameter(string $queryParameterName, &$queryParameterValue = null): bool```:
Returns ```true``` if the given parameter was requested by the client, ```false``` otherwise. If requested, it
acknowledges the parameter (i.e. tells, that it will handle the parameter) and provides its value.
* ```getPendingQueryParameters(): array``` Returns the list of requested query parameters as key (attribute name) value
  (attribute value) pairs.
* ```getOptions(): array``` Returns the list of options for the data providing connector backend.
* ```setOptions(array $options)``` Set the list of (modified) options for the data providing connector backend. 

Note that the built-in event subscriber described in [Local Data Mapping Config](#local-data-mapping-config) can also
be used to allow local queries.

### Local Query Requests

Local Query parameters can be specified by clients using the `queryLocal` parameter provided by Base Entity GET
operations. The format of the `queryLocal` parameter is a comma-seperated list of  
`<parameter key>:<parameter value>` pairs, where ```<parameter value>``` must be URL encoded:

```php
queryLocal=<parameterName>:<parameterValue>,...
```

The server will return a client error if

* The format of the `queryLocal` parameter value is invalid.
* A requested query parameter was not acknowledged by any event subscriber.
