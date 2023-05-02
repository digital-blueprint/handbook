# BasePerson Connector Bundle for LDAP

If you are using LDAP as your source for identity management, you can install the
[BasePerson Connector Bundle for LDAP](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-connector-ldap-bundle),
which allows you to connect the [Base Person Bundle](./base-person/) to your LDAP server.

## Installation

!!! warning "Important"

    Make sure you are using the [API Server Template](https://gitlab.tugraz.at/dbp/relay/dbp-relay-server-template) as
    template Symfony application or have added the [DBP Symfony recipe repository](https://github.com/digital-blueprint/symfony-recipes)
    to your application to get the configuration file and environment variables installed automatically.


```bash
# Install the bundle
composer require dbp/relay-base-person-connector-ldap-bundle
```

## Configuration

You need to add some environment variables to your `.env` file, like in this example:

```bash
# LDAP
LDAP_PERSON_PROVIDER_LDAP_HOST=directory.server.domain
LDAP_PERSON_PROVIDER_LDAP_USERNAME=cn=middleware,o=uni
LDAP_PERSON_PROVIDER_LDAP_BASE_DN=o=uni
LDAP_PERSON_PROVIDER_LDAP_PASSWORD=

LDAP_PERSON_PROVIDER_LDAP_ATTRIBUTE_IDENTIFIER=cn
LDAP_PERSON_PROVIDER_LDAP_ATTRIBUTE_GIVEN_NAME=givenName
LDAP_PERSON_PROVIDER_LDAP_ATTRIBUTE_FAMILY_NAME=sn
LDAP_PERSON_PROVIDER_LDAP_ATTRIBUTE_EMAIL=mail
LDAP_PERSON_PROVIDER_LDAP_ATTRIBUTE_BIRTHDAY=DateOfBirth
```

## Customization

The bundle sends out [certain events](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-connector-ldap-bundle/-/tree/main#events)
you can hook on to inject specific information in an event subscriber.
Please take a look at the [Event Subscriber Documentation](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-connector-ldap-bundle/-/tree/main#events)
of the bundle for more information.

If you don't need any customization, you don't need to implement any event subscribers, but the ones needed by the software package you are using.

### Check-in

For the [Check-In project](../../blueprints/check-in.md) you need to set `ROLE_SCOPE_LOCATION-CHECK-IN` and `ROLE_SCOPE_LOCATION-CHECK-IN-GUEST`
as `ldap-roles` for the person. You can do that by implementing an event subscriber for the `PersonFromUserItemPostEvent` event.

Please take a look at the [PersonFromUserItemPostEvent Documentation](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-connector-ldap-bundle/-/tree/main#personfromuseritempostevent)
of the bundle for more information.

An event subscriber receives a `\Dbp\Relay\BasePersonConnectorLdapBundle\Event\PersonFromUserItemPostEvent` instance
in a service for example in `src/EventSubscriber/PersonFromUserItemSubscriber.php`:

```php
<?php

declare(strict_types=1);

namespace App\EventSubscriber;

use Dbp\Relay\BasePersonConnectorLdapBundle\Event\PersonFromUserItemPostEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class PersonFromUserItemSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PersonFromUserItemPostEvent::NAME => 'onPost',
        ];
    }

    public function onPost(PersonFromUserItemPostEvent $event)
    {
        $person = $event->getPerson();

        // TODO: Add code to decide what roles a user has.
        $roles = ['ROLE_SCOPE_LOCATION-CHECK-IN', 'ROLE_SCOPE_LOCATION-CHECK-IN-GUEST'];
        $person->setExtraData('ldap-roles', $roles);

        $event->setPerson($person);
    }
}
```

You can find the full example at [PersonFromUserItemSubscriber.php](https://gitlab.tugraz.at/dbp/relay/examples/relay-checkin-api/-/blob/main/src/EventSubscriber/PersonFromUserItemSubscriber.php).

Afterwards best do a `composer install` to make sure caches are cleared and everything is in order.

### Greenlight

[Greenlight project](../../blueprints/greenlight.md) you need to set `ROLE_SCOPE_GREENLIGHT` as `ldap-roles` for the person.
You can do that by implementing an event subscriber for the `PersonFromUserItemPostEvent` event.

Please take a look at the [PersonFromUserItemPostEvent Documentation](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-connector-ldap-bundle/-/tree/main#personfromuseritempostevent)
of the bundle for more information.

An event subscriber receives a `\Dbp\Relay\BasePersonConnectorLdapBundle\Event\PersonFromUserItemPostEvent` instance
in a service for example in `src/EventSubscriber/PersonFromUserItemSubscriber.php`:

```php
<?php

declare(strict_types=1);

namespace App\EventSubscriber;

use Dbp\Relay\BasePersonConnectorLdapBundle\Event\PersonFromUserItemPostEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class PersonFromUserItemSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PersonFromUserItemPostEvent::NAME => 'onPost',
        ];
    }

    public function onPost(PersonFromUserItemPostEvent $event)
    {
        $person = $event->getPerson();

        // TODO: Add code to decide what roles a user has.
        $roles = ['ROLE_SCOPE_GREENLIGHT'];
        $person->setExtraData('ldap-roles', $roles);

        $event->setPerson($person);
    }
}
```

You can find the full example at [PersonFromUserItemSubscriber.php](https://gitlab.tugraz.at/dbp/relay/examples/relay-greenlight-api/-/blob/main/src/EventSubscriber/PersonFromUserItemSubscriber.php).

Afterwards best do a `composer install` to make sure caches are cleared and everything is in order.

### ESign

[Esign project](../../blueprints/esign.md) you need to set the roles you set in `config/packages/dbp_relay_esign.yaml` as
`ldap-roles` for the person if it should have permission to the signature profile.
You can do that by implementing an event subscriber for the `PersonFromUserItemPostEvent` event.

Please take a look at the [PersonFromUserItemPostEvent Documentation](https://gitlab.tugraz.at/dbp/relay/dbp-relay-base-person-connector-ldap-bundle/-/tree/main#personfromuseritempostevent)
of the bundle for more information.

An event subscriber receives a `\Dbp\Relay\BasePersonConnectorLdapBundle\Event\PersonFromUserItemPostEvent` instance
in a service for example in `src/EventSubscriber/PersonFromUserItemSubscriber.php`:

```php
<?php

declare(strict_types=1);

namespace App\EventSubscriber;

use Dbp\Relay\BasePersonConnectorLdapBundle\Event\PersonFromUserItemPostEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class PersonFromUserItemSubscriber implements EventSubscriberInterface
{
    public static function getSubscribedEvents(): array
    {
        return [
            PersonFromUserItemPostEvent::NAME => 'onPost',
        ];
    }

    public function onPost(PersonFromUserItemPostEvent $event)
    {
        $person = $event->getPerson();

        // TODO: Add code to decide what roles a user has.
        // These are the scopes you set in `config/packages/dbp_relay_esign.yaml`
        $roles = ['ROLE_SCOPE_YOUR_SCOPE1', 'ROLE_SCOPE_YOUR_SCOPE2'];
        $person->setExtraData('ldap-roles', $roles);

        $event->setPerson($person);
    }
}
```

You can find the full example at [PersonFromUserItemSubscriber.php](https://gitlab.tugraz.at/dbp/relay/examples/relay-esign-api/-/blob/main/src/EventSubscriber/PersonFromUserItemSubscriber.php).

Afterwards best do a `composer install` to make sure caches are cleared and everything is in order.
