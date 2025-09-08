# Assets & Bundle Layout

In some cases a component, in addition to Javscript files, also contains CSS
files, images, JS workers, etc. that are not handled by the JS bundler. For
example:

* An "icon" components wants to include extra SVG files.
* A component wraps a library which expects CSS files to be in a hardcoded place
  and the CSS references images with relative paths and hardcoded names.
* A component uses a library that ships JSON files including translations which
  that library expects in a certain location.

This aren't problems a bundler can solve, as it only knows about JS files, so we
have provide a separate mechanism to deal with such files.

## Asset Copy Configuration

In case you have files that need to be copied to a certain location and
structure, you can define them in package.json, like this:

```json
{
  "dbp": {
    "assets": [
      {
        "srcPackage": "@dbp-toolkit/common",
        "src": "assets/icons/*.svg",
        "dest": "icons"
      }
    ]
  }
}
```

- **srcPackage:** npm package name where files are located
- **src:** source path within srcPackage (string, array, or glob pattern)
- **dest:** destination directory (string or array)

This allows dependencies of this package to copy the files into the expected
place during the build. The files will be copied to
`dist/local/<npm-package-name-of-the-component>/<dest>`.

## Asset URL Imports Configuration

In case you want to import a file, like a CSS file, and get an URL to that file,
you can define them in package.json, like this:

```json
{
  "dbp": {
    "urls": [
      {
        "srcPackage": "select2",
        "src": "**\/*.css"
      }
    ]
  }
}
```

- **srcPackage:** npm package name where files are located
- **src:** source path within srcPackage (string, array, or glob pattern)

Example import:

```js
import select2CSSPath from 'select2/dist/css/select2.min.css';
```

The imported file will be copied during the build process to the `/dist/shared`
directory and the import will return a URL to that file, relative to the bundle
root. Since you don't control how the file is named and where it exactly ends
up, this means the file can't be referenced, or reference other files with a
fixed name or path.

## Bundle Layout

`/dist`:

The bundle root. This contains the index.html, other static files referenced
from there, and the application and activity Javascript entry points.

`/dist`:

Assume this is the directory where everything ends up

`/dist/*`:

Where all the bundle entry points end up.

`/dist/shared/*`:

This is were all auto generated and ideally content-hashed files end up. Usually
produced by the bundling process. This directory can have longer caching
durations as the file names depend on the content.

`/dist/local/<npm-package-name-of-the-component>/*`:

This is where all files end up that need to have a fixed name/path and belong to
the package. Packages should not directly access files belonging to other
packages, unless the path is retrieved via a JS API, to avoid unexpected
breakages when packages are updated.

Since these files have fixed names the cache duration should be limited to
avoid stale data on re-deploys.

## Custom Assets

We allow developers to define custom assets, which means that the default dbp assets get overwritten by assets which the developers can define. This allows developers to develop for different environments, for example for a whitelabel dbp app and simultaneously for another organization with different assets.
To use custom assets, a directory with all custom assets has to be placed in `assets_custom/dbp-appname/assets/`. For example, for mono the directory name would be `assets_custom/dbp-mono/assets/`.
The structure of the `assets_custom/dbp-appname/assets/` directory has to be the same as the default assets directory `assets/`. Thus, files and directories with the same name inside of `assets/` also have to be present inside `assets_custom/dbp-appname/assets/`.
We recommend to simply copy the `assets/` directory to `assets_custom/dbp-appname/assets/` and to replace all dbp assets with the respective custom assets. This way, it is unlikely that some assets are forgotten when creating the custom assets directory.