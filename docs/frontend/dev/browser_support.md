# Browser Compatibility / Requirements

We currently target the following browsers:

- Firefox 67+ (2019-05)
- Chrome 67+ (2018-05)
- Edge 79+ (2020-01)
- Safari 12.1+ (2019-03)
- Opera 64+ (2019-10)
- iOS Safari 12.2+/iOS 12.2+ (2019-03)
- Android 4.4+ (2013): Chrome 80 as well as Firefox 68 can be installed on Android 4.4

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

We use extra tooling/pollyfills:

- [babel](https://babeljs.io/docs/en/babel-preset-env) for translating newer
  Javascript to something the above mentioned versions can run and to work
  around bugs in those versions.
- [event-target-shim](https://www.npmjs.com/package/event-target-shim) for
  supporting [EventTarget
  constructors](https://caniuse.com/mdn-api_eventtarget_eventtarget) on older
  Safari.

## Handling of old Browsers

In case our modules are used with a too old browser this can lead to the following issues:

* The page stays empty since it fails to load the Javascript or fails to parse it
* The application works but some (possibly key) features are broken

To avoid such scenarios and to give the user proper feedback, we provide a standalone feature-detection script which gets loaded alongside the application and replaces the whole page with an information overlay in case a required feature is missing:

https://gitlab.tugraz.at/dbp/web-components/toolkit/-/blob/master/packages/common/misc/browser-check.js

## Device Resolution Support

We currently try to target "iPhone SE 1st gen" as the lowest supported (CSS) resolution: 320 x 568

See https://www.ios-resolution.com, https://www.mydevice.io/#compare-devices and https://en.wikipedia.org/wiki/IPhone_SE_(1st_generation) for more information.
