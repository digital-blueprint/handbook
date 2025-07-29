# Fonts

You can apply a font by adding the font-family to the `html` or `body` in a css `<style>` tag.

If you want to apply multiple fonts for multiple themes then add the `font-family` property to the appropriate css class.

## Self-hosted fonts

You can host your fonts locally and import them in the `<style>` tag of the `index.html`.
Then you can apply it to the style with adding the `font-family` to body, html or a specific theme.

For example:

```html
 <style>
    @import "<%= getPrivateUrl('fonts/nunito-sans/300.css') %>";
    @import "<%= getPrivateUrl('fonts/nunito-sans/300-italic.css') %>";
    @import "<%= getPrivateUrl('fonts/nunito-sans/700.css') %>";
    @import "<%= getPrivateUrl('fonts/nunito-sans/700-italic.css') %>";


    body {
        font-family: 'Nunito Sans', 'Calibri', 'Arial', 'sans-serif';
        line-height: 1.4em;
        font-weight: 400;
        }
</style>
```

## External Fonts

You can also import external fonts, e.g. Google fonts, by adding the import statement in the `<head>` tag of `ìndex.html`
an embedding the font in the `font-family` css part, as described above.

For example:

```html
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">

    <style>
        html {
            font-family: 'Roboto', sans-serif;
        }
    </style>
</head>
```

Note:

* Eventually update your data protection site to inform users about the external font usage.
* If external fonts are not loaded, make sure to check the CSP settings of the app.

## Font weights

Our web components use the css property font-weight with the relative weight values lighter and bolder.
So be carefully with the initial font weight. Take a look at this documentation about relative font weight at [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#meaning_of_relative_weights){:target="_blank"}.
