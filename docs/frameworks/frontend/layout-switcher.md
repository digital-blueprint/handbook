# `LayoutSwitcher` 

## Overview

The `LayoutSwitcher` is a Web Component built with Lit, designed to toggle between layout modes (e.g., `standard`, `wide`). It handles screen-size responsiveness, stores user preferences, and integrates with internationalization.

---

## Features

- Toggle between layouts: `standard`, `wide`, etc.
- Responsive to screen width.
- Persists layout preference via `localStorage`.
- Supports disabling layouts or the entire switcher.
- i18n-ready for translation.
- Uses a dropdown UI with icons.
- Lightweight and customizable.

---

## Basic Knowledge

To work effectively with the `LayoutSwitcher` component, you should be familiar with:

- **HTML/CSS**  
  Understanding of semantic HTML elements and responsive design using CSS.

- **JavaScript (ES6+)**  
  Comfort with modern JavaScript syntax (e.g., `classes`, `arrow functions`, `template literals`, `Promises`).

- **Web Components**  
  Basic knowledge of custom elements, shadow DOM, and lifecycle callbacks (`connectedCallback`, `disconnectedCallback`).

- **Lit Library**  
  Understanding how Lit handles templating, reactivity, and component rendering (`html`, `css`, `@property`, etc.).
  
---

## Usage

```
<layout-switcher
  app-name="myApp"
  default-layout="standard"
  disabled-layout="wide"
  lang-dir="ltr">
</layout-switcher>

---

## Properties & Attributes

| Property          | Type      | Attribute         | Description                                                                 |
| ----------------- | --------- | ----------------- | --------------------------------------------------------------------------- |
| `appName`         | `string`  | `app-name`        | Namespace for layout persistence. Required.                                 |
| `langDir`         | `string`  | `lang-dir`        | Language direction (`ltr` or `rtl`).                                        |
| `isDisabled`      | `boolean` | `disabled`        | Disables layout switching UI.                                               |
| `layout`          | `string`  | –                 | Current layout (e.g., `wide`, `standard`).                                  |
| `layouts`         | `Array`   | –                 | Available layout options (default: `[{name: 'wide'}, {name: 'standard'}]`). |
| `defaultLayout`   | `string`  | `default-layout`  | Default layout if none is stored.                                           |
| `disabledLayout`  | `string`  | `disabled-layout` | Disables one layout and forces the other.                                   |
| `isDefaultLayout` | `boolean` | –                 | Whether current layout is `standard`.                                       |
| `dropdown`        | `boolean` | –                 | Dropdown visibility state.                                                  |

---

## Icons

In digital blueprint frontends you can also change icons. (E.g. if you have your own icon set or want to change specific icons).
