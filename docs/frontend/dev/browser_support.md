# Browser Compatibility / Requirements

We currently target the following browsers:

- Firefox 69+ (2019-09)
- Chrome 71+ (2018-12)
- Edge 79+ (2020-01)
- Safari 13.1+ (2020-03)
- Opera 64+ (2019-10)
- iOS Safari 13.4+/iOS 13+ (2020-03)
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

We use extra tooling/pollyfills:

- [babel](https://babeljs.io/docs/en/babel-preset-env) for translating newer
  Javascript to something the above mentioned versions can run and to work
  around bugs in those versions.
- [event-target-shim](https://www.npmjs.com/package/event-target-shim) for
  supporting [EventTarget
  constructors](https://caniuse.com/mdn-api_eventtarget_eventtarget) on older
  Safari.
- [@webcomponents/scoped-custom-element-registry](https://www.npmjs.com/package/@webcomponents/scoped-custom-element-registry) for Scoped Custom Element Registries, for all browsers.

## Rules for when Browsers can potentially be dropped

See https://github.com/browserslist/browserslist

For example this query can be use as a rough guideline:

```
npx browserslist "> 0.5% in alt-EU, last 1 years, Firefox ESR, not dead"
```

## Handling of old Browsers

In case our modules are used with a too old browser this can lead to the following issues:

* The page stays empty since it fails to load the Javascript or fails to parse it
* The application works but some (possibly key) features are broken

To avoid such scenarios and to give the user proper feedback, we provide a standalone feature-detection script which gets loaded alongside the application and replaces the whole page with an information overlay in case a required feature is missing:

https://github.com/digital-blueprint/toolkit/blob/main/packages/common/misc/browser-check.js

## Device Resolution Support

We currently try to target "iPhone SE 1st gen" as the lowest supported (CSS) resolution: 320 x 568

See https://www.ios-resolution.com, https://www.mydevice.io/#compare-devices and https://en.wikipedia.org/wiki/IPhone_SE_(1st_generation) for more information.
