# Custom Icons

In digital blueprint frontends you can also change icons. (E.g. if you have your own icon set or want to change specific icons).

The icon override work similar to the color override - with css variables.
To override an icon you have to write in a css selector the prefix `--dbp-override-icon-` + the icon name.
You can find the icon name of a specific icon with the site-inspector, e.g. from [mozilla firefox](https://developer.mozilla.org/de/docs/Tools/Page_Inspector){:target="_blank"}  or the [chrome DevTools](https://developer.chrome.com/docs/devtools/){:target="_blank"}.
You can also take a look at the [icon vendor](https://github.com/digital-blueprint/toolkit/tree/main/packages/common/assets/icons){:target="_blank"} in the toolkit repository.

Now you can override any icon with that css variable. Simply pass the new icon with its relative path to the css variable with `url()`.

Example:
```css
.html {
    --dbp-override-icon-iconname: url("pathto/newicon.svg");
}
```

The new icon should be type of **svg**.

Further information about CSS variables in general can be found at [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties){:target="_blank"}.

You can change these icons for all themes or only for one theme.
If you want to override variables in multiple themes read the [readme](https://github.com/digital-blueprint/toolkit/tree/main/packages/theme-switcher#usage-in-an-application-with-appshell){:target="_blank"} of the theme-switcher web component.

## Favicons

### Replace favicons & PWA icon
If you want to change the favicons and PWA icons you have to simply replace the content of their files. We have generated all favicons or app icon sizes for supported browsers.
To change the favicons you have to replace the files in *images* directory. Don't rename them! They should have the same name and the same size as the default files.
You can use the free & open source Image editor [GIMP](https://www.gimp.org/){:target="_blank"} for resizing and exporting your favicon.

#### How to resize your logo with GIMP
1. Open you logo as svg with 300dpi and a large resolution in [GIMP](https://www.gimp.org/){:target="_blank"}.
2. Clip your layer to the logo: `layer -> Clip to content`
3. Crop the image to the layer: `ìmage -> fit canvas to layer`
4. Change canvas size to a square: `image -> canvassize ->` change the canvas size to a square, add a small padding and click `center` and `change size`
5. Scale the image to the recommended size: `image -> scale image` choose the size you want
6. Export the image with the correct name `file -> export to` select standards and export it
7. Replace the old favicon file with your favicon file

### Use the dbp favicon and app-icon with your brand colors
If you don't want to create an own PWA icon or an own favicon, we provided the possibility to simple change the colors of the digital blueprint favicon/app icon to your brand colors.
For that you have to edit the [whitelabel app icon](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/favicon_appicon/app_icons/whitelabel){:target="_blank"} (which you need) and the [whitelabel favicon](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/favicon_appicon/favicon/whitelabel){:target="_blank"}. You can find the im the [dbp Corporate Identity](https://gitlab.tugraz.at/dbp/dbp-ci){:target="_blank"} gitlab repository.
You can use the free & open source vector based image editor [InkScape](https://inkscape.org/de/){:target="_blank"} for editing your icons.

#### How to change the colors of the icon
The following steps has to be done for the whitelabel favicon and the whitelabel app icon.
You can read [here](../../../cd/apps.md#favicons-of-apps) which resolutions and formats are used by the two files.

1. Open the needed svg whitelabel icon file in [InkScape](https://inkscape.org/de/){:target="_blank"}
2. Double-click on the first square, then a line in the middle of the square should appear: the gradient line
3. Right-click on the square and open the window "fill and outline", now you can see the gradient with two colors
4. In the window(fill and outline -> fill) you can choose one point on the gradient by clicking on it. then you can change the color of it. Make your color changes in the first square
5. Repeat these steps for the other squares
6. Save the file

For creating the right resolution take a look at the section [How to resize your logo with GIMP](#how-to-resize-your-logo-with-gimp) above.
