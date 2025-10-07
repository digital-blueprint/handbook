# Translations

We use [i18next](https://www.i18next.com/) for internationalization (i18n) and
maintain the translations in JSON files directly in the git repository.

## LangMixin

The `LangMixin` adds internationalization (i18next) support to your components,
enabling them to dynamically switch languages and translate content.

```javascript
import { LitElement, html } from 'lit';
import { createI18n } from './i18n/factory.js';
import { LangMixin } from '@dbp-toolkit/common';

class MyComponent extends LangMixin(LitElement, createI18n) {
  render() {
    return html`
      <div>
        <h1>${this._i18n.t('welcome')}</h1>
        <p>${this._i18n.t('description')}</p>
        
        <button @click=${() => this.lang = 'en'}>English</button>
        <button @click=${() => this.lang = 'de'}>Deutsch</button>
      </div>
    `;
  }
}
```

In case the `_i18n` property would conflict with another property, you can
specify a custom property name:

```javascript
class MyComponent extends LangMixin(LitElement, createI18n, '_translator') {
  render() {
    return html`
      <h1>${this._translator.t('hello')}</h1>
    `;
  }
}
```

The component will automatically re-render when the `lang` property changes,
updating all translated content.

## Managing Translations with i18next Parser

We use [i18next-cli](https://github.com/i18next/i18next-cli) for
automatically extracting translation keys from the code and maintaining the
translation files.

To update the translation files, run: `npm i18next:fix`

In case you want you want to translate keys that are not in the code, but either
dynamically created, or come from another source, i18next-cli will not be
able to find them and remove them from the translation files.

You can work around the issue by listing all keys in a comment somewhere:

```javascript
/*
t('my-keys.somekey')
t('my-keys.somekey2')
*/
```

