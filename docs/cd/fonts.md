# Fonts

## Logo Font
The logo uses the open source font [Montserrat](https://github.com/JulietaUla/Montserrat){:target="_blank"}.

- **Headline**: Montserrat Semibold 600
- **Subheadline**: Montserrat Light 300

If you want to [adapt](../logo/adaption) the logo then you have to [install](#install-fonts-on-your-developing-device) this font on your device.
You can also find the Font in gitlab [DBP-CI](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/fonts/Montserrat){:target="_blank"}.

## Text/Web/Print font
For all other uses except the logo we use the open source font [Nunito Sans](https://github.com/googlefonts/NunitoSans){:target="_blank"}

- **Headlines**: Nunito Sans ExtraLight 200, Nunito Sans SemiBold 600
- **Subheadlines** Nunito Sans ExtraLight 200 Italic,
- **Text**: Nunito Sans ExtraLight (200), Nunito Sans SemiBold (600)

You can also find the Font in gitlab [DBP-CI](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/fonts/Nunito_Sans){:target="_blank"}.

## Install and Import fonts

### Install fonts on your developing device
For developing or designing you may have to install some fonts on your working device.
Simply open the *\*.ttf* file with a double click, then click `install`.

### Import your font for theming
Take a look at [fonts](../frontend/theming/#fonts) in the "theming and individualizing your application" section for further information about using your own fonts and other adaptions. 

### Import fonts in an repository

To add a font to your repository simply call
```bash
yarn add @fontsource/nunito-sans
 ```
Now you have to adapt the `rollup.config.js`, 
so that the fonts are loaded in the dist folder.

Add 
```js
{
    src: await getPackagePath('@fontsource/nunito-sans', '*'),
    dest: 'dist/' + (await getDistPath(pkg.name, 'fonts/nunito-sans')),
}
```
in the copy function.


Now you can use the font like this:

```ejs
 <style>

        @import "<%= getPrivateUrl('fonts/nunito-sans/200.css') %>";
        @import "<%= getPrivateUrl('fonts/nunito-sans/200-italic.css') %>";
        @import "<%= getPrivateUrl('fonts/nunito-sans/600.css') %>";
        @import "<%= getPrivateUrl('fonts/nunito-sans/600-italic.css') %>";


        body {
            font-family: 'Nunito Sans', 'Calibri', 'Arial', 'sans-serif';
            line-height: 1.4em;
            font-weight: 200;
            margin: 0;
        }
</style>
```
in your `index.html.ejs`.




