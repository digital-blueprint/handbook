# LayoutSwitcher 

The `LayoutSwitcher` is a Web Component built with Lit, designed to toggle between layout modes (e.g., `standard`, `wide`). It handles screen-size responsiveness, stores user preferences, and integrates with internationalization.

## Features

- Toggle between layouts: `standard`, `wide`, etc.
- Responsive to screen width.
- Persists layout preference via `localStorage`.
- Supports disabling layouts or the entire switcher.
- i18n-ready for translation.
- Uses a dropdown UI with icons.
- Lightweight and customizable.

**Basic Knowledge:**

- HTML/CSS 
- JavaScript (ES6+)
- Web Components
- Lit Library
 
## Basic Usage

import { LayoutSwitcher } from './path-to/LayoutSwitcher.js';

```html
<layout-switcher
  app-name="myApp"
  default-layout="standard"
  disabled-layout="wide"
  lang-dir="ltr">
</layout-switcher>
```


## Properties & Attributes

| Property          | Type      | Attribute         | Description                                                                 |
| ----------------- | --------- | ----------------- | --------------------------------------------------------------------------- |
| `appName`         | `string`  | `app-name`        | App namespace for stored settings                                           |
| `langDir`         | `string`  | `lang-dir`        | Text direction (e.g. `'ltr'`, `'rtl'`).                                     |
| `isDisabled`      | `boolean` | `disabled`        | If true, disables the switcher                                              |
| `layout`          | `string`  | –                 | Current layout (e.g., `wide`, `standard`).                                  |
| `layouts`         | `Array`   | –                 | Available layout options (default: `[{name: 'wide'}, {name: 'standard'}]`). |
| `defaultLayout`   | `string`  | `default-layout`  | Default layout if none is stored.                                           |
| `disabledLayout`  | `string`  | `disabled-layout` | Disables one layout and forces the other.                                   |
| `isDefaultLayout` | `boolean` | –                 | Whether current layout is `standard`.                                       |
| `dropdown`        | `boolean` | –                 | Dropdown visibility state.                                                  |


## Accessibility

- Uses semantic HTML (ul, li, a) for better accessibility.
- All interactive elements are keyboard and screen-reader friendly.
- Dropdown closes on outside click.

## Methods
- toggleLayout(layout: string): void
Switches to a given layout, stores the choice, updates UI and fires layout-changed.

- loadDefaultLayout(): void
Marks current layout as default (standard).

- loadAlternateLayout(): void
Marks current layout as alternate (wide).

- updateLayoutBasedOnWindowSize(): void
Sets layout to wide on narrow screens (<871px), or to stored/default layout on wider screens.

- toggleLayoutMenu(e: Event): void
Toggles visibility of the dropdown layout menu.

- hideLayoutMenu(e: Event): void
Hides the layout menu when clicking outside it.

- _getStoredLayout(): string
Returns layout value from localStorage.

- _setStoredLayout(value: string): void
Stores layout value in localStorage.

## Responsive behavior:

Layout switcher icon hidden on screens <871px.

## Icons & Fonts
- Uses <dbp-icon> from @dbp-toolkit/common for both switcher and menu options.

- You must ensure the dbp-icon element is globally available or provided in the app (as shown in scopedElements).

- No specific font is required—component inherits your app’s font.

## i18n
The component is internationalized using createInstance() and supports the following translation keys:

Key	Usage
- switch-layout	Tooltip for layout toggle button
- switch-to-wide-layout-label	Tooltip for wide layout option
- switch-to-standard-layout-label	Tooltip for standard layout option
- wide-layout-name	Label for wide layout option
- standard-layout-name	Label for standard layout option
   



