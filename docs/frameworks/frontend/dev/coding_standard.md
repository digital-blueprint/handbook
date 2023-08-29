# Coding Standard

For our Javscript projects we currently use the following tools:

* [ESLint](https://eslint.org/) - a static code analyzer
* [Prettier](https://prettier.io/) - an opinionated code formatter
* [Typescript](https://www.typescriptlang.org/) - a type checker for Javascript (and its own langauge, but we only use the type checking part)

To invoke the tools:

* `npm lint` - will run eslint on the project and warn on errors
* `npm format` - will reformat the project using both eslint and prettier
* `npm tsc` - will run the type checker on the project

## Static Type Checking

We currently use pure Javascript for our code and add inline documentation and
extra type information via [jsdoc](https://jsdoc.app/).

* `eslint` will enforce certain rules about the inline documentation and the types, on a local level
* `typescript` uses the type information to check the code for errors, on a global level

For more information on type checking with Typescript see
https://www.typescriptlang.org/docs/handbook/intro-to-js-ts.html

For the subset of jsdoc syntax that Typescript understands see
https://www.typescriptlang.org/docs/handbook/jsdoc-supported-types.html

It's recommended to use VSCode as your editor, as it has good integration with
the typescript language server.

## Prettier Pitfalls

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