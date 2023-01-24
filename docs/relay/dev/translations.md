# Translations

Translations in a bundle can be stored as message files under `Resources/translations`. See https://symfony.com/doc/current/translation.html#translation-resource-file-names-and-locations

The active locale for each request is set automatically by Symfony via the `Accept-Language` header. This means the correct translations will be picked up automatically.

In case an endpoint can't set a language via an header the controller needs to take a `lang` query parameter and set the Symfony locale via:

```php
use Dbp\Relay\CoreBundle\Locale\Locale;

// ... inject Locale service
$locale->setCurrentRequestLocaleFromQuery('lang');
// or
$locale->setRequestLocaleFromQuery($request, 'lang');
```

In case you need a language string for an external service/API based on the active locale:

```php
use Dbp\Relay\CoreBundle\Locale\Locale;

// ... inject Locale service
$lang = $locale->getCurrentPrimaryLanguage();
// $lang is in ISO 639-1 format
```
