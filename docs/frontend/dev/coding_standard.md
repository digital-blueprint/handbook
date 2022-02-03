# Coding Standard

For our Javscript projects we currently use the following tools:

* [ESLint](https://eslint.org/) - a static code analyzer
* [Prettier](https://prettier.io/) - an opinionated code formatter

To invoke the tools:

* `yarn lint` - will run eslint on the project and warn on errors
* `yarn format` - will reformat the project using both eslint and prettier

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
