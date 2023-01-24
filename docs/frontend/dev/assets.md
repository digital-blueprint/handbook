# Assets & Bundle Layout

In some cases a component, in addition to Javscript files, also contains CSS
files, images, JS workers that are not handled by the bundler. For example:

* An "icon" components wants to include extra SVG files.
* A component wraps a library which expects CSS files to be in a hardcoded place
  and the CSS references images with relative paths and hardcoded names.
* A component uses a library which uses web workers, which atm can't be bundled
  to ES6 modules because [most browsers don't support
  them](https://caniuse.com/mdn-api_worker_worker_ecmascript_modules), so they
  have to be copied as is.
* A component uses a library that ships JSON files including translations which
  that library expects in a certain location.

In some cases this can be worked around in the bundler by using plugins to
inline the files into JS and thus make them part of the bundling process:

* [@rollup/plugin-json](https://www.npmjs.com/package/@rollup/plugin-json) can
  be used to convert JSON files to Javascript.

Sadly the only way atm (ideas to improve this welcome) is to leak this
implementation detail out and leave the copying of those files to the
integrator/bundle creator.

To somewhat improve this we use a set of rules for how our packages expect those
files to end up in the file system in relation to the bundle.

## Bundle Layout

`/dist`:

Assume this is the directory where everything ends up

`/dist/*`:

Where all the bundle entry points end up.

`/dist/shared/*`:

This is were all auto generated and ideally content-hashed files end up. Usually
produced by the bundling process. This directory can have longer caching
durations as the file names depend on the content.

`/dist/local/<npm-package-name-of-the-component>/*`:

This is where all files end up that need to have a fixed name/path.

For example an icon component could have `/dist/local/my-icon/foo.svg`. The
files that need to be copied there need to be documented in the README of the
respective component. This also applies to all transitive dependencies, so if
COMPONENT-A wants asset ASSET-A and depends on COMPONENT-B which needs ASSET-B,
then you using COMPONENT-A requires you to copy both ASSET-A and ASSET-B.

Since these files have fixed names the cache duration should be limited to
avoid stale data on re-deploys.