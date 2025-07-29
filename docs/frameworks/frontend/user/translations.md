# Overriding Translations

!!! warning "Currently in development"

    This feature is currently in development, thus not everything may work as explained here. Translation overrides are not yet supported in the main versions of the apps!

You can override the default translations provided by us in your application at spots that subscribe to the `lang-dir` attribute.
To override the default translations, a few things have to be done.

 * The spot where you want to insert your translation has to support overrides. Thus, it has to subscribe to the `lang-dir` attribute. This should be the case for most components.
 * You have to know which key you want to override. To see the translation keys, you can use the frontend debug mode. This is done by appending `#debug` at the end of the webpage and reloading the page. Then all text that uses translation keys gets replaced by the translation key.
 * You need to write a translation file with your override translations. This is done in `json` format. Since [i18next](https://www.i18next.com/) is used as a translation engine, please have a look at the [i18n json documation](https://www.i18next.com/misc/json-format). You will have to provide a `translation.json` file for each language you want to translate your page into.
 * The translation file has to be located in a defined directory. By default, the translation directory is in `assets/translations/`. Each language needs its own directory with only one file inside which has to be named `translation.json`. Thus, if you want a german and a english translation, you will need the files `assets/translations/de/translation.json` and `assets/translations/en/translation.json`. Currently, only english and german are supported.
 * Translation override files containing all keys and all default translations are already present in the given location. You can simply change the given translations and insert your translations.

 If you want to add new translations and extend the webpage, please have a look at the [translation developer guide](../dev/translations.md).

### Example
Consider the following scenario:

You want to replace the text in a save button. By default, the button shows the text `Save` but you want to change it to `Submit`. The website in debug mode shows you the key `dbp-create-3g-ticket.save-btn`. This means that the button text is provided by the activity object namespace `dbp-create-3g-ticket` which contains the key `save-btn`. An example override translation file (for english) could look something like this:
```json
{
  ...
  "dbp-create-3g-ticket": {
    ...
    "save-btn": "Save",
    ...
  },
  ...
}
```
To change the translation, you just need to change the value associated with the key.
```json
{
  ...
  "dbp-create-3g-ticket": {
    ...
    "save-btn": "Submit",
    ...
  },
  ...
}
```
