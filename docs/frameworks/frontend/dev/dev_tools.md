# Development Tools

## Linting & Formatting & Type Checking

For our Javscript projects we currently use the following tools:

- [Oxlint](https://oxc.rs/docs/guide/usage/linter.html) - a static code analyzer
- [Prettier](https://prettier.io/) - an opinionated code formatter
- [i18next-cli](https://github.com/i18next/i18next-cli) - a tool for automatically maintaining translation files
- [Typescript](https://www.typescriptlang.org/) - a type checker for Javascript (and its own language, but we only use the type checking part)

To invoke the tools:

- `npm oxlint` - will run oxlint on the project and warn on linting errors and type errors
- `npm oxlint:fix` - will run oxlint on the project and try to fix errors
- `npm prettier` - will error out on any formatting issues
- `npm prettier:fix` - will reformat the project
- `npm i18next` - will error out on any translation issues
- `npm i18next:fix` - will fix translation issues if possible

There are grouped commands for the tools, so you can run all of them at once:

- `npm check` - will run oxlint, prettier and i18next
- `npm fix` - will run oxlint, prettier and i18next and try to fix all issues

### Type Checking

We currently use pure Javascript for our code and add inline documentation and
extra type information via [jsdoc](https://jsdoc.app/).

- `oxlint` will enforce certain rules about the inline documentation and the
  types (linting). It uses Typescript internally to also check for type related
  issues (type aware linting) and forwards all Typescript errors to the user, so
  you can use it as a type checker as well (type checking)
- `typescript` is what oxlint uses internally for gathering type information.
  You can also run it directly via `npm run tsc` to check for type errors.

For more information on type checking with Typescript see
https://www.typescriptlang.org/docs/handbook/intro-to-js-ts.html

For the subset of jsdoc syntax that Typescript understands see
https://www.typescriptlang.org/docs/handbook/jsdoc-supported-types.html

It's recommended to use VSCode as your editor, with the following plugins:

* https://marketplace.visualstudio.com/items?itemName=oxc.oxc-vscode
* https://marketplace.visualstudio.com/items?itemName=TypeScriptTeam.native-preview

### Prettier Pitfalls

Formatters like Prettier can't just move html tags around because in some cases whitespace changes also change the presentation on the rendered website.

The following results in `Foobar` being rendered:

```html
<div>Foo<span>bar</span></div>
```

If it was re-formatted without taking into account the whitespace it would render as `Foo bar` instead:

```html
<div>
  Foo
  <span>bar</span>
</div>
```

This is why by default Prettier knows which tags are `display:inline` tags and respects the whitespace in that context.

The problem with web components is that Prettier can't know if they are inline or block elements, so it defaults to "inline" just to be safe, which results in not very nice re-formatting with split tags.

Thus we set the Prettier config to ignore whitespace in all cases (html-whitespace-sensitivity=ignore). In case the whitespace is relevant you can tell Prettier to not reformat it via an inline comment:

```html
<!-- prettier-ignore -->
<div>Foo<span>bar</span></div>
```

Once https://github.com/prettier/prettier/issues/12218 is fixed/released you can also use `<!-- display: inline -->` in front of the inline tag.

## Package Management & Bundling

For package management we use npm. We use workspaces in combination with mono repos and git submodules to allow developing multiple packages at the same time.

For managing mono repos we also use [lerna](https://lerna.js.org/), which allow
us to run tasks for all included packages.

For bundling we use [rolldown](https://rolldown.rs/) since it's fast, relatively
easy to use, but still can be extended through various plugins.

It's recommended to always call `npm dedupe` after changing dependencies, as
duplicate versions of the same package will make bundling fail. `dependabot`
does this automatically for us, but if you change a dependency manually you need
to run it yourself.

## Testing

To run unit tests for a package:

```
npm install
npm run test
```

- We use [@web/test-runner](https://modern-web.dev/docs/test-runner/overview/) +
  [mocha](https://mochajs.org) \+ [chai](https://www.chaijs.com) +
  [playwright](https://github.com/microsoft/playwright) with Chromium/Firefox to
  run unit tests both locally and in CI.

- We use [Playwright](https://playwright.dev/) to run end-to-end tests on
  deployed apps both locally and in CI for Chromium/Firefox.

- We use [GitHub Actions](https://github.com/features/actions) for our CI.
