# Build Tooling

For package management we use [yarn 1.x](https://classic.yarnpkg.com) since it
provides support for monorepos through yarn workspaces and allows to hoist
dependencies in mono repos so bundles can consume them. We have not looked into
yarn 2.x+ and the new workspaces support in nom 7.x+.

For managing mono repos we also use [lerna](https://lerna.js.org/), which allow
us to run tasks for all included packages.

For bundling we use [rollup](https://rollupjs.org) since it's relatively easy to
use, but still can be extended through various plugins.