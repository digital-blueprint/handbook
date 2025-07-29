# Custom Colors & Styling

DBP also supports multiple themes. To create multiple themes look in the
[readme](https://github.com/digital-blueprint/toolkit/tree/main/packages/theme-switcher#usage-in-an-application-with-appshell){:target="_blank"}
of the theme-switcher web component.

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
