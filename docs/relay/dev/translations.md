# Translations

Translations in a bundle can be stored as message files under `Resources/translations`. See https://symfony.com/doc/current/translation.html#translation-resource-file-names-and-locations

The active locale for each request is set automatically by Symfony via the `Accept-Language` header.

In case an endpoint can't set a language via an header the controller needs to take a `lang` query parameter and set the Symfony locale via:

```php
if ($request->query->has('lang')) {
    $lang = $request->query->get('lang');
    assert(is_string($lang));
    $locale = \Locale::acceptFromHttp($lang);
    if ($locale !== false) {
        $request->setLocale($locale);
    }
}
```

In case you need a language string for an external service based on the active locale:

```php
$request = $requestStack->getCurrentRequest();
$locale = ($request !== null) ? $request->getLocale() : \Locale::getDefault();
$lang = \Locale::getPrimaryLanguage($locale) : 'en';
```
