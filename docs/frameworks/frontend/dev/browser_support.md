# Browser Compatibility / Requirements

We currently target the following browsers:

- Firefox 69+ (2019-09)
- Chrome 71+ (2018-12)
- Edge 79+ (2020-01)
- Safari 14+ (2020-09)
- Opera 64+ (2019-10)
- iOS Safari 14+/iOS 14+ (2020-09)
- Android 4.4+ (2013): Chrome 80 can be installed on Android 4.4

These version requirements are derived from requiring the following features:

- [Custom Elements (V1)](https://caniuse.com/custom-elementsv1)
- [JavaScript modules: dynamic
  import()](https://caniuse.com/es6-module-dynamic-import)
- [Shadow DOM (V1)](https://caniuse.com/shadowdomv1)
- [JavaScript statement:
  import.meta](https://caniuse.com/mdn-javascript_statements_import_meta)
- [JavaScript modules via script tag](https://caniuse.com/es6-module)
- [Async functions](https://caniuse.com/async-functions)
- [AbortController & AbortSignal](https://caniuse.com/abortcontroller)
- [Resize Observer](https://caniuse.com/resizeobserver)
- [globalThis](https://caniuse.com/mdn-javascript_builtins_globalthis)
- [Intl.PluralRules](https://caniuse.com/intl-pluralrules)
- [EventTarget constructor](https://caniuse.com/mdn-api_eventtarget_eventtarget)

We use extra tooling/pollyfills:

- [babel](https://babeljs.io/docs/en/babel-preset-env) for translating newer
  Javascript to something the above mentioned versions can run and to work
  around bugs in those versions.
- [@webcomponents/scoped-custom-element-registry](https://www.npmjs.com/package/@webcomponents/scoped-custom-element-registry) for Scoped Custom Element Registries, for all browsers.

## Rules for when Browsers can potentially be dropped

See https://github.com/browserslist/browserslist

For example this query can be use as a rough guideline:

```
npx browserslist "> 0.5% in alt-EU, last 1 years, Firefox ESR, not dead"
```

## Browser Testing

We currently use [playwright](https://playwright.dev) for end-to-end testing of
our frontend code. Due to the way playwright only supports the latest versions
of browsers, we do not test against older versions of the browsers we support.
We also don't test with Safari at the moment.

In case there are any issues with older versions of the browsers we support,
please let us know and we will try to fix them. We can't guarantee that we will
notice these issues automatically.

See the playwright release notes for the currently supported browsers in the
latest version: https://playwright.dev/docs/release-notes

## Handling of old Browsers

In case our modules are used with a too old browser this can lead to the following issues:

* The page stays empty since it fails to load the Javascript or fails to parse it
* The application works but some (possibly key) features are broken

To avoid such scenarios and to give the user proper feedback, we provide a standalone feature-detection script which gets loaded alongside the application and replaces the whole page with an information overlay in case a required feature is missing:

https://github.com/digital-blueprint/toolkit/blob/main/packages/common/misc/browser-check.js

Example usage:

```html
  <script src="browser-check.js" defer></script>
  <noscript>This application requires Javascript</noscript>
```

Since the check uses eval() for some of the feature checks, it is not compatible with CSPs that disallow eval(). To avoid
this, you can use the `noeval` option when loading the script:

```html
<script src="browser-check.js?noeval" defer></script>
```

## Device Resolution Support

We currently try to target "iPhone SE 1st gen" as the lowest supported (CSS) resolution: 320 x 568

See https://www.ios-resolution.com, https://www.mydevice.io/#compare-devices and https://en.wikipedia.org/wiki/IPhone_SE_(1st_generation) for more information.
