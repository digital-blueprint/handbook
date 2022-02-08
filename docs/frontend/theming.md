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


The following variables must be set, when you use multiple themes or special colors.
The default oft these colors would be always the dbp colors.

alle farben ohne postfix sollen funktionieren auf base,
 sonst auf den on surfaces

--dbp-override-default

| Name               | Variable                           | Usage | Recommendation | Default |
| ------------------ | ---------------------------------- | ----- | ------------| ------- |
| Background         |`--dbp-override-background`         | Background color | A neutral light or dark color | `#ffffff` |
| Content            |`--dbp-override-content`            | Used as the text color or anything on the base, except surfaces | Black or white, depending on the base, WCAG Level to `--dbp-override-background` should be AA | `#000000` |
| Content surface    |`--dbp-override-content-surface`    | Used as the text color or anything on the base, except surfaces | Black or white, depending on the base, no WCAG Level needed. | `#000000` |
| On content surface |`--dbp-override-on-content-surface` | The default color for all elements above a surface | A color with high contrast, e.g. black or white| `#ffffff` |
| |
| Hover Background Color | `--dbp-override-hover-background-color`    |
| Hover color            | `--dbp-override-hover-color` |
| Border radius          | `--dbp-override-border-radius`    |
| border                 | `--dbp-override-border`    |
| |
| Muted            |`--dbp-override-muted`          | Muted text, or speration items on base | Neutral gray, WCAG Level to `--dbp-override-base` should be AA | `#767676` |
| Muted surface    |`--dbp-override-muted`          | Muted text, or speration items on base | Neutral gray, WCAG Level to `--dbp-override-base` should be AA | `#767676` |
| On muted surface |`--dbp-override-muted`          | Muted text, or speration items on base | Neutral gray, WCAG Level to `--dbp-override-base` should be AA | `#767676` |
| |
| Primary            | `--dbp-override-primary`            | Used for Text in Primary color on base | WCAG Level to `--dbp-override-base` should be AA | `#2a4491`
| Primary surface    | `--dbp-override-primary-surface`    | Is used for surface in the primary color, like buttons that are responsible for the flow of the UI |   No WCAG Level needed. | `#2a4491` |
| On primary surface | `--dbp-override-on-primary-surface` | Is used for elements above a primary surfaces, like text in primary buttons |  WCAG Level to `--dbp-override-primary-surface` should be AA | `#ffffff` |
| Primary boarder    | `--dbp-override-primary-border`     | Is used for primary buttons as border |  | `1px solid #000000` |
| |
| Accent             |`--dbp-override-accent`            | Used in the menu, for active elements, focus effect or for some icons, anything which should have an accent. | Should a color with a recognition value for the university.  WCAG Level to `--dbp-override-base` should be AA| `#c24f68` |
| Accent surface     |`--dbp-override-accent-surface`    | Used when the accent color is needed as an surface | Should a color with a recognition value for the university. No WCAG Level needed. | `#c24f68` |
| Accent on surface  |`--dbp-override-on-accent-surface` | Used on accent surfaces | WCAG Level to `--dbp-override-accent` should be AA | `#ffffff` |
| |

``

**Accent:** Akzentfarbe, wird im Menü, oder für manche Icons verwendet
*dbp-accent-light-theme*, *dbp-accent-dark-theme*

**Primary:** wird für Buttons die für den Flow der UI verantwortlich sind verwendet
*dbp-primary-light-theme*, *dbp-primary-dark-theme*

**Secondary:** Wird für zusätzliche Buttons, Funktionen, Navigations Möglichkeiten verwendet
*dbp-secondary-light-theme*, *dbp-secondary-dark-theme*

**Success:** eine success Farbe (Empfohlen: Grün) wird für Notifikationen und erfolgreiche oder auch korrekte Rückmeldungen benutzt.
*dbp-success-light-theme*, *dbp-success-dark-theme*

**Warning:** Eine warnign Farbe (Empfohlen: Orange/Gelb/Braun), wird verwendet für Notifikationen oder warnende Elemente (!!! Achtung, bei den warning notifications wird die Farbe vom dark theme (*dbp-warning-dark-theme*) als Hintergrund genommen, da es keine angenehme Warning Farbe gibt, die ausreichend kontrastreich zu weiß ist)
*dbp-warning-light-theme*, *dbp-warning-dark-theme*

**Danger:** Eine danger color (Empfohlen: Rot/Orange/Pink), wird für Notifikationen und nicht erfolgreich oder inkorrekte Rückmeldungen benutzt.
*dbp-danger-light-theme*, *dbp-danger-dark-theme*

**Info:** Eine Info color (Empfohlen: Blau/Violett), wird für Notifikationen und Hinweise benutzt
*dbp-info-light-theme*, *dbp-info-dark-theme*

**Boarder:** gibt an welchen Rahmen man haben möchte. z.b. *boarder-light-theme*: 1px solid #000000, wird verwendet für Buttons, diverse Trenner zwischen unterschiedlichen Sektionen, Unterstreichungen von Links
*dbp-boarder-light-theme*, *dbp-boarder-dark-theme*

**border-radius:** gibt den Boarden Radius von Buttons an.
*dbp-boarder-radius*, *dbp-boarder-radius*

**Hover-base:** Gibt die Hintergrundfarbe eines Buttons oder Links wenn man das Element hovert an
*dbp-hover-base-light-theme*, *dbp-hover-base-dark-theme*

**Hover-text:** Gibt die Textfarbe eines Buttons oder Links wenn man das Element mit der Maus hovert an
*dbp-hover-text-light-theme*, *dbp-hover-text-dark-theme*

Diese Farben gibt es, wie am Anfang beschrieben, für ein Light und für ein Darktheme. (z.b.: *dbp-primary-light-theme*, *dbp-primary-dark-theme* **(bessere Namen willkommen)**), für das Light Theme verwendet man vorzugsweise kräftige Farben, deren Kontrast zu der *dbp-base-light-theme* Farbe (Empfohlen: Weiß) hoch genug ist (AA Level). Für das Dark Theme verwendet man kontrastreiche Farben, deren Kontrast zu der *dbp-base-dark-theme* Farbe (Empfohlen: Schwarz) hoch genug ist (AA Level).

**Hinweis:** Werden Variablen nicht deklariert, werden die default Farbwerte benutzt. Auch müssen nicht alle Farben unterschiedlich sein. Z.B.: Die Primary color kann auch die Accent color sein.

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