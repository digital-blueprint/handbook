# Build Tooling

For package management we use npm. We use workspaces in combination with mono repos and git submodules to allow developing multiple packages at the same time.

For managing mono repos we also use [lerna](https://lerna.js.org/), which allow
us to run tasks for all included packages.

For bundling we use [rollup](https://rollupjs.org) since it's relatively easy to
use, but still can be extended through various plugins.
