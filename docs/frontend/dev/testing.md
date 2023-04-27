# Testing

To run unit tests for a package:

```
npm install
npm run test
```

* We use [karma](https://karma-runner.github.io) + [mocha](https://mochajs.org)
  \+ [chai](https://www.chaijs.com) with Chromium/Firefox to run unit tests both
  locally and in CI.

  We could look into [jsdom](https://github.com/jsdom/jsdom) for testing as an
  alternative. Last time we looked things were blocked on
  https://github.com/jsdom/jsdom/pull/2548, but this is now fixed. Testing with
  a fake browser has the downside of missing bugs in real browsers, so not sure
  if this is worth it.

* We use [cypress](https://www.cypress.io) to run end-to-end tests on deployed
  apps both locally and in CI for Chromium/Firefox/Edge.

* We use [GitLab CI](https://docs.gitlab.com/ee/ci) for our CI.
