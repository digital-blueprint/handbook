# Theming

## Creating and applying a color-theme

### Fonts

#### Selfhosted Fonts
You can host your fonts locally and import them in the `<style>` tag of the `index.html`. 
Then you can apply it to the style with adding the `font-family` to body, html or a specific theme.

For example:

```html
 <style>
        @import "/app/local/@dbp-topics/greenlight/fonts/source-sans-pro/300.css";
        @import "/app/local/@dbp-topics/greenlight/fonts/source-sans-pro/400.css";
        @import "/app/local/@dbp-topics/greenlight/fonts/source-sans-pro/600.css";

        body {
            font-family: 'Source Sans Pro', 'Calibri', 'Arial', 'sans-serif';
            font-weight: 300;
        }
</style>
```

#### External Fonts

You can also import external fonts, e.g. Google fonts, by adding the import statement in the `<head>` tag of `ìndex.html`
an embedding the font in the `font-family` css part, as described above.

For example:

```html
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>

<style>
    html {
        font-family: 'Roboto', sans-serif;
    }
</style>

```

### Colors System

### Color System

To make the colors as customizable as possible, there is a dbp color system.

For universities, these colors should have a contrast level of at least AA in contrast to the base color.

alle farben ohne postfix sollen funktionieren auf base,
sonst auf den on surfaces


The following variables must be set, when you use multiple themes or special colors.
The default oft these colors would be always the dbp colors.

#### Color Variables:
| * | Name               | Variable                           | Usage | Recommendation | Default |
| -------- | ------------------ | ---------------------------------- | ----- | -------------- | ------- |
| ✓ | Background         |`--dbp-override-background`         | Background color | A neutral light or dark color | `#ffffff` |
| ✓ | Content            |`--dbp-override-content`            | Used as the text color or any element on the `--dbp-override-background`, except surfaces | Black or white, depending on the base, WCAG Level to `--dbp-override-background` should be AA | `#000000` |
|   | Content surface    |`--dbp-override-content-surface`    | Used flat surfaces in front of the background, e.g. modal overlay | Black/white, No WCAG Level needed. | `--dbp-override-content` |
|   | On content surface |`--dbp-override-on-content-surface` | The color for all elements above the content surface | White/black, WCAG Level to `--dbp-override-content` should be AA | `--dbp-override-background` |
| |
|   | Border             | `--dbp-override-border`                 | Applies a border to elements, like buttons, boxes, links, modals, boxes, seperationlines | You can set here the border-width, border-style and border-color. A WCAG Level to `--dbp-override-background` of AA is recommended | `1px solid #000000` |
|   | Border radius      | `--dbp-override-border-radius`          | Applies a border radius to element which can have a border, like buttons, boxes, notifications, modal ... | | `0px` |
|   |
| ✓ | Primary            | `--dbp-override-primary`            | Used for elements in primary color on the `--dbp-override-background` | WCAG Level to `--dbp-override-background` should be AA | `#2a4491`
|   | Primary surface    | `--dbp-override-primary-surface`    | Is used for surface in the primary color, like buttons that are responsible for the flow of the UI |   No WCAG Level needed. | `--dbp-override-primary` |
|   | On primary surface | `--dbp-override-on-primary-surface` | Is used for elements above a primary surfaces, like text in primary buttons |  WCAG Level to `--dbp-override-primary-surface` should be AA | `--dbp-override-on-content-surface` |
|   | Primary surface border color | `--dbp-override-primary-surface-border-color` | Is used for primary buttons border color | Set this var only if you want another color for the border | `--dbp-override-primary-surface` |
| |
| ✓ | Secondary            | `--dbp-override-secondary`            | Used for elements in secondary color on the `--dbp-override-background` | WCAG Level to `--dbp-override-background` should be AA | `#2a4491`
|   | Secondary surface    | `--dbp-override-secondary-surface`    | Is used for surfaces in the secondary color, for additional buttons, functions, navigation options |   No WCAG Level needed. | `--dbp-override-secondary` |
|   | On secondary surface | `--dbp-override-on-secondary-surface` | Is used for elements above a secondary surfaces, like text in secondary buttons |  WCAG Level to `--dbp-override-primary-surface` should be AA | `--dbp-override-on-content-surface` |
|   | Secondary surface border color | `--dbp-override-secondary-surface-border-color` | Is used for secondary buttons as border color | Set this var only if you want another color for the border | `--dbp-override-secondary-surface` |
| |
| ✓ | Muted              |`--dbp-override-muted`            | Muted text, or speration items on the `--dbp-override-background` | Neutral gray, WCAG Level to `--dbp-override-background` should be AA | `#767676` |
|   | Muted surface      |`--dbp-override-muted-surface`    | Neutral flat surfaces | Neutral gray, WCAG Level to `--dbp-override-base` should be AA | `--dbp-override-muted` |
|   | On muted surface   |`--dbp-override-on-muted-surface` | Elements on muted surfaces | white, WCAG Level to `--dbp-override-muted-surface` should be AA | `--dbp-override-on-content-surface` |
|   | Muted surface border color | `--dbp-override-muted-surface-border-color` | Is used for border color at muted surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-muted-surface` |
| |
| ✓ | Accent            |`--dbp-override-accent`            | Used in the menu, for active elements, focus effect or for some icons, anything which should have an accent on the `--dbp-override-background`. | Should a color with a recognition value for the university.  WCAG Level to `--dbp-override-background` should be AA| `#c24f68` |
|   | Accent surface    |`--dbp-override-accent-surface`    | Used when the accent color is needed as an surface | Should a color with a recognition value for the university. No WCAG Level needed. | `--dbp-override-accent` |
|   | On accent surface |`--dbp-override-on-accent-surface` | Used on accent surfaces | WCAG Level to `--dbp-override-accent` should be AA | `--dbp-override-on-content-surface` |
|   | Accent surface border color | `--dbp-override-accent-surface-border-color` | Is used for border color at accent surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-accent-surface` |
| |
| ✓ | Info            |`--dbp-override-info`            | Used for informational elements, like text, hints, on the `--dbp-override-background` | Blue, violett  WCAG Level to `--dbp-override-background` should be AA | `#2a4491` |
|   | Info surface    |`--dbp-override-info-surface`    | Used when the informational color is needed as an surface, like hints, info boxes, info notifications | Blue, violett, No WCAG Level needed. | `--dbp-override-info` |
|   | On info surface |`--dbp-override-on-info-surface` | Used on info surfaces | WCAG Level to `--dbp-override-info` should be AA | `--dbp-override-on-content-surface` |
|   | Info surface border color | `--dbp-override-info-surface-border-color` | Is used for border color at info surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-info-surface` |
| |
| ✓ | Success            |`--dbp-override-success`            | Used for success elements, like text, on the `--dbp-override-background` | Green,  WCAG Level to `--dbp-override-background` should be AA | `#188018` |
|   | Success surface    |`--dbp-override-success-surface`    | Used when the success color is needed as an surface, like success boxes, success notifications | Green, No WCAG Level needed. | `--dbp-override-success` |
|   | On success surface |`--dbp-override-on-success-surface` | Used on success surfaces | WCAG Level to `--dbp-override-success` should be AA | `--dbp-override-on-content-surface` |
|   | Success surface border color | `--dbp-override-success-surface-border-color` | Is used for border color at success surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-success-surface` |
| |
| ✓ | Warning            |`--dbp-override-warning`            | Used for warning elements, like text, on the `--dbp-override-background` | Yellow/orange/brown,  WCAG Level to `--dbp-override-background` should be AA | `#c15500` |
|   | Warning surface    |`--dbp-override-warning-surface`    | Used when the warning color is needed as an surface, like warning boxes, warning notifications | Yellow/orange/brown, No WCAG Level needed. | `--dbp-override-warning` |
|   | On warning surface |`--dbp-override-on-warning-surface` | Used on warning surfaces | WCAG Level to `--dbp-override-warning` should be AA | `--dbp-override-on-content-surface` |
|   | Warning surface border color | `--dbp-override-warning-surface-border-color` | Is used for border color at warning surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-warning-surface` |
| |
| ✓ | Danger            |`--dbp-override-danger`            | Used for danger elements, like text, error messages, incorrect feedback, on the `--dbp-override-background` | Orange/Red/Pink,  WCAG Level to `--dbp-override-background` should be AA | `#de3535` |
|   | Danger surface    |`--dbp-override-danger-surface`    | Used when the danger color is needed as an surface, like danger boxes, danger notifications, error messages or incorrect feedback | Orange/Red/Pink, No WCAG Level needed. | `--dbp-override-danger` |
|   | On danger surface |`--dbp-override-on-danger-surface` | Used on danger surfaces | WCAG Level to `--dbp-override-danger` should be AA | `--dbp-override-on-content-surface` |
|   | Danger surface border color | `--dbp-override-danger-surface-border-color` | Is used for border color at danger surfaces | Set this var only if you want another color for the border of the surface | `--dbp-override-danger-surface` |
| |
|   | Hover Background Color | `--dbp-override-hover-background-color` | Used for hover effects. If this var is set, all buttons, navigation elements and links have this color as background on hover. | If `--dbp-override-hover-color` is set, the WCAG Level to `--dbp-override-hover-color` should be AA, else WCAG Level to `--dbp-override-content` should be AA | not set|
|   | Hover color            | `--dbp-override-hover-color`            | Used for hover effects. If this var is set, all buttons, navigation elements and links have this color on hover. | If `--dbp-override-hover-background-color` is set, the WCAG Level to `--dbp-override-hover-background-color` should be AA, else WCAG Level to `--dbp-override-background` should be AA | not set |

<b>*</b> These attributes are required, if you have more than one theme or a dark theme. 


**Hinweis:** Werden Variablen nicht deklariert, werden die default Farbwerte benutzt. Auch müssen nicht alle Farben unterschiedlich sein. Z.B.: Die Primary color kann auch die Accent color sein.

### WCAG Level

## Icons

## Slots
You can use various slots to customize your application. The code for the slots is based between the 
`<template id="global-override">` tag of your application. 


### Appshell slots
You can adapt the **name**, **title**, **logo** or exchange the whole **header**, the **footer-links** 
or exchange the whole **footer**. 
The nearer description can be found in the documentation of the [appshell](https://gitlab.tugraz.at/dbp/web-components/toolkit/-/tree/master/packages/app-shell).

You should place these slots in the `<template id= "global-override">` tag of your `index.html`.

For example:

```html
<template id="global-override">
    <template id="dbp-greenlight">
        <div slot="name">
            DBP<br />
            <dbp-translated subscribe="lang">
                <div slot="de">
                    Meine Universität
                </div>
                <div slot="en">
                    My University
                </div>
            </dbp-translated>
        </div>
    </template>
</template>

```

### App specific Slots
Often there are app-specific slots or rather, activity-specific slots. These slots are often used for text customization. 
In the activity description, in the `src` folder of the application you can read which slots are avaiable.

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
                    Creates a ticket for access to premises of TU Graz.
                </div>
            </dbp-translated>
        </template>
    </dbp-acquire-3g-ticket>
</template>

```
