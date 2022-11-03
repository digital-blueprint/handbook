# Translations
!!! warning "Currently in development"

    This feature is currently in development, thus not everything may work as explained here. Translation overrides are not yet supported in the main versions of the apps!

To handle translations, [i18next](https://www.i18next.com/) is used.
All apps, activities and toolkit components contain default translations by default, if the respective part needs translations. The [i18n namespace](https://www.i18next.com/principles/namespaces) `translation` contains all default translations while the i18n namespace `--translation-override` contains all loaded override translations. This is consistent over all apps, activities and toolkit components.
Default translations are handled locally, while override translations are handled globally. Thus, if you want to define a key, you have to be sure that this key is not taken yet. Otherwise, when using translation overrides, all components that subscribe to the `lang-dir` attribute will receive the key. Therefore, you *cannot* use the same key names across components that subscribes to the `lang-dir` attribute, or else they will receive the same translation! Theoretically, if a component does not use translation overrides (e.g. if it doesnt support the `lang-dir` attribute), then the used keys do not have to be unique globally. However, it is best practice to still make them unique globally.
Since it is very difficult to know if a translation key is already taken or not, `json` objects are used as a kind of namespace (not to be confused with [i18n namespaces](https://www.i18next.com/principles/namespaces)) to distinguish between keys with the same name. This way, the keys only need to be unique in each `json` object namespace. Later on this page, a table with reserved object namespaces is mentioned. Do not create object namespaces with the same name, or else it could lead to key collisions!

## Overriding default translations
To override the default translations and customize the application, you simply need to alter the already given override files. These files are located in `assets/translations/lang-code/translation.json`. Every single key that can be overriden should be listed there with its respective default translation.
In order to see which key leads to which text, a translation debug mode can be used. This debug mode is enabled by appending `#debug` at the end of the URL and reloading the page. Then, the website should replace all text by its respective key. A more detailed introduction into overriding default translations can be found at the page [Theming and individualizing your application](../theming.md).


## Detailed inner workings
Default translations get loaded at startup. Thus, every part that uses i18n translations get some default translations by default. This is done in default [i18n fashion](https://www.i18next.com/how-to/add-or-load-translations) by adding the translation on init.
However, override translations get loaded at runtime. While loading a app, a request is sent to retrieve all override translations. They asynchronously get added to a designated i18n override namespace called `--translation-override` and this i18n namespace gets set as default namespace, while the default translation are maintained in a i18n namespace called `translation` and this namespace gets set as fallback namespace. This means that if a translation key is not present in the override translations the default translation of this key still get loaded. Thus, a empty webpage is prevented if some mistakes happen while loading translations or while creating the translation override files.
Each component that supports overrides can subscribe to the `lang-dir` attribute to receive override translations. Whether a component should be able to receive overrides or not is up for the developer to decide. If at least one component uses override translations, it is nearly no overhead if a second component uses them too because the retrieved override translations get cached. Thus, only one request is sent overall regardless of how many components use override translations. If a component does not support the `lang-dir` attribute, then it probably does not support translation overrides as well.

### dbp-translation component
The dbp-translation component is used to inject translation using i18n into provided slots. A documentation on available slots can be found at [Theming and individualizing your application](../theming.md). The sole purpose of this component is the usage in slots. This allows the usage of i18n for translations and furthermore this allows you to interact with other dbp components, mainly the language-picker. The dbp-translation component needs to subscribe to `lang-dir, lang` to receive the translation overrides and language change events.

#### Interpolation and Unsafe translations
The dbp-translation component can also be used to inject [interpolations](https://www.i18next.com/translation-function/interpolation) into i18n. For this, the `var` attribute can be used. A json string can be specified and passed to the dbp-translation component using the attribute `var`. The component then uses [i18n interpolation](https://www.i18next.com/translation-function/interpolation) to create the translated text. By default, all translation strings get escaped to mitigate XSS attacks. Therefore, a second attribute called `unsafe` can be used to indicate if the translation string contains values that should be unescaped (e.g. HTML code) to work correctly. `unsafe` and `var` are often used together, to display links for example.

#### Example

Consider the following scenario:

You want to use the slot `footer-links` which is provided by the app-shell to display your contact email as a link.
The follow override translation file (for english) and HTML snipped to the index.html can be used to achieve this.
```json
"dbp-translation": {
    "footer-contact": "<a rel=\"noopener\" href=\"{{- link}}\" class=\"footer-link\">Contact</a>"
},
```
```HTML
<div slot="footer-links" class="footer-links">
  <dbp-translation subscribe="lang, lang-dir" key="footer-contact" var='{"link": "my-email@example.com"}' unsafe>
  </dbp-translation>
</div>
```

`{{- link}}` inserts the value with the key `"link"` from the `var` attribute into the value of `"footer-contact"` as an unescaped [i18n value](https://www.i18next.com/translation-function/interpolation#unescape).


## Reserved object namespaces
| Namspace | Description |
|----------|-------------|
| dbp | Common dbp namespace, mainly used for toolkit components |
| dbp-translation | Namespace for the dbp-translation component |
