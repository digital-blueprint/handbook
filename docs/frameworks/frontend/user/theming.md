# Theming and individualizing your application

**Basic Knowledge:** CSS, HTML

**Recommended Knowledge**: [GIMP](https://www.gimp.org/){:target="_blank"}, [InkScape](https://inkscape.org/de/){:target="_blank"} (or similar)


You can adapt the **[fonts](./fonts.md)**, the **[colors](#color-system)**, and some **parts** in the form of [slots](#slots).
Moreover, you can also change favicons and browser specific items ([Favicons, Search Engine and more](#favicons-search-engine-and-more)).

DBP also supports multiple themes. To create multiple themes look in the [readme](https://github.com/digital-blueprint/toolkit/tree/main/packages/theme-switcher#usage-in-an-application-with-appshell){:target="_blank"} of the theme-switcher web component.

## Color System

To make the colors as customizable as possible, there is a dbp color system.

You can override the default colors for customize your app. For universities, these colors should have a contrast level of at least AA in contrast to the base color.
You can read more about the minimal contrast level in [Accessibility](../dev/accessibility.md#minimal-contrast-level).

All colors without a postfix need to work on top of the "base" color. All others need to work on top of their respective surface colors.

The default oft these colors would be always the dbp colors.

### Color Variables:
| * | Name               | Variable                           | Usage | Recommendation | Default |
| -------- | ------------------ | ---------------------------------- | ----- | -------------- | ------- |
| ✓ | Background         |`--dbp-override-background`         | Background color | A neutral light or dark color | `#ffffff` |
| ✓ | Content            |`--dbp-override-content`            | Used as the text color or any element on the `--dbp-override-background`, except surfaces | Black or white, depending on the base, WCAG Level to `--dbp-override-background` should be AA | `#222120` |
|   | Content surface    |`--dbp-override-content-surface`    | Used flat surfaces in front of the background, e.g. modal overlay | Black/white, No WCAG Level needed. | `--dbp-override-content` |
|   | On content surface |`--dbp-override-on-content-surface` | The color for all elements above the content surface | White/black, WCAG Level to `--dbp-override-content` should be AA | `--dbp-override-background` |
| |
| ✓ | Border             | `--dbp-override-border`                 | Applies a border to elements, like buttons, boxes, links, modals, boxes, separation lines | You can set here the border-width, border-style and border-color. A WCAG Level to `--dbp-override-background` of AA is recommended | `1px solid #222120` |
|   | Border radius      | `--dbp-override-border-radius`          | Applies a border radius to element which can have a border, like buttons, boxes, notifications, modal ... | | `0px` |
|   |
| ✓ | Primary            | `--dbp-override-primary`            | Used for elements in primary color on the `--dbp-override-background` | WCAG Level to `--dbp-override-background` should be AA | `#3775c1`
|   | Primary surface    | `--dbp-override-primary-surface`    | Is used for surface in the primary color, like buttons that are responsible for the flow of the UI |   No WCAG Level needed. | `--dbp-override-primary` |
|   | On primary surface | `--dbp-override-on-primary-surface` | Is used for elements above a primary surfaces, like text in primary buttons |  WCAG Level to `--dbp-override-primary-surface` should be AA | `--dbp-override-on-content-surface` |
|   | Primary surface border color | `--dbp-override-primary-surface-border-color` | Is used for primary buttons border color | Set this var only if you want another color for the border | `--dbp-override-primary` |
| |
| ✓ | Secondary            | `--dbp-override-secondary`            | Used for elements in secondary color on the `--dbp-override-background` | WCAG Level to `--dbp-override-background` should be AA | `#222120`
|   | Secondary surface    | `--dbp-override-secondary-surface`    | Is used for surfaces in the secondary color, for additional buttons, functions, navigation options |   No WCAG Level needed. | `--dbp-override-secondary` |
|   | On secondary surface | `--dbp-override-on-secondary-surface` | Is used for elements above a secondary surfaces, like text in secondary buttons |  WCAG Level to `--dbp-override-primary-surface` should be AA | `--dbp-override-on-content-surface` |
|   | Secondary surface border color | `--dbp-override-secondary-surface-border-color` | Is used for secondary buttons as border color | Set this var only if you want another color for the border | `--dbp-override-secondary` |
| |
| ✓ | Muted              |`--dbp-override-muted`            | Muted text, or separation items on the `--dbp-override-background` | Neutral gray, WCAG Level to `--dbp-override-background` should be AA | `#767676` |
|   | Muted surface      |`--dbp-override-muted-surface`    | Neutral flat surfaces | Neutral gray, WCAG Level to `--dbp-override-base` should be AA | `--dbp-override-muted` |
|   | On muted surface   |`--dbp-override-on-muted-surface` | Elements on muted surfaces | white, WCAG Level to `--dbp-override-muted-surface` should be AA | `--dbp-override-on-content-surface` |
|   | Muted surface border color | `--dbp-override-muted-surface-border-color` | Is used for border color at muted surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-muted` |
| |
| ✓ | Accent            |`--dbp-override-accent`            | Used in the menu, for active elements, focus effect or for some icons, anything which should have an accent on the `--dbp-override-background`. | Should a color with a recognition value for the university.  WCAG Level to `--dbp-override-background` should be AA| `#9e1e4d` |
|   | Accent surface    |`--dbp-override-accent-surface`    | Used when the accent color is needed as an surface | Should a color with a recognition value for the university. No WCAG Level needed. | `--dbp-override-accent` |
|   | On accent surface |`--dbp-override-on-accent-surface` | Used on accent surfaces | WCAG Level to `--dbp-override-accent` should be AA | `--dbp-override-on-content-surface` |
|   | Accent surface border color | `--dbp-override-accent-surface-border-color` | Is used for border color at accent surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-accent` |
| |
| ✓ | Info            |`--dbp-override-info`            | Used for informational elements, like text, hints, on the `--dbp-override-background` | Blue, violett  WCAG Level to `--dbp-override-background` should be AA | `#38808a` |
|   | Info surface    |`--dbp-override-info-surface`    | Used when the informational color is needed as an surface, like hints, info boxes, info notifications | Blue, violett, No WCAG Level needed. | `--dbp-override-info` |
|   | On info surface |`--dbp-override-on-info-surface` | Used on info surfaces | WCAG Level to `--dbp-override-info` should be AA | `--dbp-override-on-content-surface` |
|   | Info surface border color | `--dbp-override-info-surface-border-color` | Is used for border color at info surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-info` |
| |
| ✓ | Success            |`--dbp-override-success`            | Used for success elements, like text, on the `--dbp-override-background` | Green,  WCAG Level to `--dbp-override-background` should be AA | `#338555` |
|   | Success surface    |`--dbp-override-success-surface`    | Used when the success color is needed as an surface, like success boxes, success notifications | Green, No WCAG Level needed. | `--dbp-override-success` |
|   | On success surface |`--dbp-override-on-success-surface` | Used on success surfaces | WCAG Level to `--dbp-override-success` should be AA | `--dbp-override-on-content-surface` |
|   | Success surface border color | `--dbp-override-success-surface-border-color` | Is used for border color at success surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-success` |
| |
| ✓ | Warning            |`--dbp-override-warning`            | Used for warning elements, like text, on the `--dbp-override-background` | Yellow/orange/brown,  WCAG Level to `--dbp-override-background` should be AA | `#bf8808` |
|   | Warning surface    |`--dbp-override-warning-surface`    | Used when the warning color is needed as an surface, like warning boxes, warning notifications | Yellow/orange/brown, No WCAG Level needed. | `--dbp-override-warning` |
|   | On warning surface |`--dbp-override-on-warning-surface` | Used on warning surfaces | WCAG Level to `--dbp-override-warning` should be AA | `--dbp-override-on-content-surface` |
|   | Warning surface border color | `--dbp-override-warning-surface-border-color` | Is used for border color at warning surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-warning` |
| |
| ✓ | Danger            |`--dbp-override-danger`            | Used for danger elements, like text, error messages, incorrect feedback, on the `--dbp-override-background` | Orange/Red/Pink,  WCAG Level to `--dbp-override-background` should be AA | `#cc3232` |
|   | Danger surface    |`--dbp-override-danger-surface`    | Used when the danger color is needed as an surface, like danger boxes, danger notifications, error messages or incorrect feedback | Orange/Red/Pink, No WCAG Level needed. | `--dbp-override-danger` |
|   | On danger surface |`--dbp-override-on-danger-surface` | Used on danger surfaces | WCAG Level to `--dbp-override-danger` should be AA | `--dbp-override-on-content-surface` |
|   | Danger surface border color | `--dbp-override-danger-surface-border-color` | Is used for border color at danger surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-danger` |
| |
|   | Hover Background Color | `--dbp-override-hover-background-color` | Used for hover effects. If this var is set, all buttons, navigation elements and links have this color as background on hover. | If `--dbp-override-hover-color` is set, the WCAG Level to `--dbp-override-hover-color` should be AA, else WCAG Level to `--dbp-override-content` should be AA | not set|
|   | Hover color            | `--dbp-override-hover-color`            | Used for hover effects. If this var is set, all buttons, navigation elements and links have this color on hover. | If `--dbp-override-hover-background-color` is set, the WCAG Level to `--dbp-override-hover-background-color` should be AA, else WCAG Level to `--dbp-override-background` should be AA | not set |

<b>*</b> These attributes are required, if you have more than one theme or a dark theme.

**Note:** Default colors will be used in case of undeclared variables. Colors don't have to be different in all cases, for example the primary color can be the same as the accent color.

### Adapting the colors
You can override a css variable inside a selector by taking the variable and assign it to a new value.

```css
.any-selector {
    --dbp-override-background: green;
}
```

You can change the color-system in two ways: with multiple themes or only within one theme.
If you only want to use one theme you can override the variables in css inside the html selector.

```css
html {
    --dbp-override-background: black;
}
```
If you want to override variables in multiple themes read the [readme](https://github.com/digital-blueprint/toolkit/tree/main/packages/theme-switcher#usage-in-an-application-with-appshell){:target="_blank"} of the theme-switcher web component.

### Usage of these colors
In some cases you may have to use these variables (e.g. slot css). You can use these variables in css by surrounding them with a `var()` function.

E.g.:
```css
.any-selector {
    background-color: var(--dbp-override-background);
}
```

Further information about CSS variables in general can be found at [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties){:target="_blank"}.

## Icons
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


## Customizing the application with slots
You can use various slots to customize your application. You can place your custom assets like images or customized texts inside of slots to adapt the appearance of the application as you want.  

### App shell slots

<figure id="fig1" style="width:100%;">
    <img src="../assets/ui_images/DBP-UI-Design_page_02.svg" alt="App shell Slots" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 1: App shell slots visualization</b>
    </figcaption>
</figure>

<figure id="fig2">
    <img src="../assets/ui_images/DBP-UI-Design_page_05.svg" alt="App shell Slots mobile" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 2: App shell slots mobile visualization</b>
    </figcaption>
</figure>

You can adapt the **name**, **title**, **logo** or exchange the whole **header**, the **footer-links**
or exchange the whole **footer**. [[Fig. 1]](#fig1) [[Fig. 2]](#fig2)
The nearer description can be found in the documentation of the [app shell](https://github.com/digital-blueprint/toolkit/tree/main/packages/app-shell){:target="_blank"}.

You should place these slots in the `<template id= "global-override">` tag of your `index.html`.

For example, you can override the name in the top left corner, and the logo shown in the top right corner:

```html
<template id="global-override">
    <template id="dbp-greenlight">
        <div slot="name">
            MyUni<br />
            <dbp-translated subscribe="lang">
                <div slot="de">
                    Meine Universität
                </div>
                <div slot="en">
                    My University
                </div>
            </dbp-translated>
        </div>
        <div slot="logo">
            <img style="height: 80px" src="path/to/logo.svg" alt="My university logo">
        </div>
    </template>
</template>

```


### App specific Slots
Often there are app-specific slots or rather, activity-specific slots. These slots are often used for text customization.
In the activity description, in the `src` folder of the application you can read which slots are available.

You should place these slots in the `<template id= "global-override">` tag of your `index.html`.

For example:

```html
<template id="global-override">
    <dbp-acquire-3g-ticket lang="de">
        <template slot="description">
            <dbp-translated subscribe="lang">
                <div slot="de">
                    Erstellt ein Ticket für den Zugang zu Räumlichkeiten der TU Graz.
                </div>
                <div slot="en">
                    Creates a ticket for access to premise of TU Graz.
                </div>
            </dbp-translated>
        </template>
    </dbp-acquire-3g-ticket>
</template>

```

## Favicons, Search Engine and more

### Favicons
#### Replace favicons & PWA icon
If you want to change the favicons and PWA icons you have to simply replace the content of their files. We have generated all favicons or app icon sizes for supported browsers.
To change the favicons you have to replace the files in *images* directory. Don't rename them! They should have the same name and the same size as the default files.
You can use the free & open source Image editor [GIMP](https://www.gimp.org/){:target="_blank"} for resizing and exporting your favicon.

##### How to resize your logo with GIMP
1. Open you logo as svg with 300dpi and a large resolution in [GIMP](https://www.gimp.org/){:target="_blank"}.
2. Clip your layer to the logo: `layer -> Clip to content`
3. Crop the image to the layer: `ìmage -> fit canvas to layer`
4. Change canvas size to a square: `image -> canvassize ->` change the canvas size to a square, add a small padding and click `center` and `change size`
5. Scale the image to the recommended size: `image -> scale image` choose the size you want
6. Export the image with the correct name `file -> export to` select standards and export it
7. Replace the old favicon file with your favicon file

#### Use the dbp favicon and app-icon with your brand colors
If you don't want to create an own PWA icon or an own favicon, we provided the possibility to simple change the colors of the digital blueprint favicon/app icon to your brand colors.
For that you have to edit the [whitelabel app icon](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/favicon_appicon/app_icons/whitelabel){:target="_blank"} (which you need) and the [whitelabel favicon](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/favicon_appicon/favicon/whitelabel){:target="_blank"}. You can find the im the [dbp Corporate Identity](https://gitlab.tugraz.at/dbp/dbp-ci){:target="_blank"} gitlab repository.
You can use the free & open source vector based image editor [InkScape](https://inkscape.org/de/){:target="_blank"} for editing your icons.

##### How to change the colors of the icon
The following steps has to be done for the whitelabel favicon and the whitelabel app icon.
You can read [here](../../../cd/apps.md#favicons-of-apps) which resolutions and formats are used by the two files.

1. Open the needed svg whitelabel icon file in [InkScape](https://inkscape.org/de/){:target="_blank"}
2. Double-click on the first square, then a line in the middle of the square should appear: the gradient line
3. Right-click on the square and open the window "fill and outline", now you can see the gradient with two colors
4. In the window(fill and outline -> fill) you can choose one point on the gradient by clicking on it. then you can change the color of it. Make your color changes in the first square
5. Repeat these steps for the other squares
6. Save the file

For creating the right resolution take a look at the section [How to resize your logo with GIMP](#how-to-resize-your-logo-with-gimp) above.


### Preview
You also can change the name and description of each application to change the preview of it on some browsers or devices.(e.g. google preview and search engine, mobile preview, PWA's)

In the **index.html**:

- Adapt the `<meta property="og:site_name" content="">` with your site title in the `content` attribute.
- Adapt the `<meta property="og:url" content="" />`with your site url  in the `content` attribute.
- Adapt the `<meta title="">`, `<meta property="og:title" content="">` with your application title in the `title` and `content` attribute.
- Adapt the `<meta title="">`, `<meta property="og:title" content="">` with your application title in the `title` and `content` attribute.
- Adapt the `<meta name="description" content="">`, ` <meta property="og:description content="">` with your application title in the `title` and `content` attribute.


In the **app.manifest.json**:

- Adapt the `"name": ""` (max. of 45 characters)  with a human-readable name of your application.
  - It is the primary identifier of the app and displayed everytime the name of the application is shown and enough space is given.
- Adapt the `"short_name": ""` (max. of 12 characters recommended) with a short version of the human-readable name of your application.
  - It is a short version of the app's name and is displayed where not enough space for the full name, such as: app launcher, new tab page in chrome

For more information about the app.manifest.json you can read under [developer.mozilla.org](https://developer.mozilla.org/de/docs/Web/Manifest){:target="_blank"}.


### Not for using the activities embedded

To ensure a uniform and responsive design activities should occupy 100% width of the window when the activities width are under 768 px.
