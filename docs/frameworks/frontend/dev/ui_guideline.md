# UI Guidelines
These guidelines serve as a reference for developers of the digital blueprint app. They ensure that all components and layouts are designed consistently and provide a unified user experience. 
The covered topics can be found in the table of contents on the right

## App Shell

The App Shell is the fundamental structure of a digital blueprint application that loads first before any content. It provides the consistent framework within which all activities are displayed, ensuring a unified user experience across the entire application.

The App Shell consists of three main components:

1. Header `<header>` - Contains the main navigation elements [[Fig. 1]](#fig1)
2. Side Menu `<aside>` - Houses the activity navigation [[Fig. 2]](#fig2)
3. Main Content Area `<main>` - Displays the current activity content [[Fig.4]](#fig4) [[Fig.6]](#fig6)

### App Shell Behavior
#### Loading State
The App Shell loads first, providing immediate visual feedback to users while the activity content is being loaded.

#### Responsive Behavior

* Full App Shell with maximum content width of 1400px, using [standard layout](#fig6) by default
* At the breakpoint of 768px (and below) the application automatically switches to wide layout (the layout switcher is no longer available)

#### Theme Support
The App Shell supports theming through CSS variables:

* Light/Dark mode toggle  <img src="../../assets/ui_images/contrast.svg" alt="Main navigation" style="width:20px;"> in the main navigation affects the entire App Shell
* Custom themes can be implemented by overriding the CSS variables -> See [theming page](../user/styling.md#color-system).
* All App Shell components use the same variables as the rest of the application for visual consistency


## Navigation
### Main Navigation
<figure id="fig1" style="margin:0;">
    <img src="../../assets/ui_images/dbp_ui_main-navigation.svg" alt="Main navigation" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 1: Main Navigation</b>
    </figcaption>
</figure>

The main navigation [[Fig. 1]](#fig1) `<header>` is centered and contains:

* Light/Dark mode switch<br>
* Layout switch: Toggle between standard layout and wide layout<br>
* Language switch: EN & DE<br>
* Logged-in user<br>

### Side Menu
<figure id="fig2" style="margin:0; ">
    <img src="../../assets/ui_images/dbp_ui_side-navigation.svg" alt="Listed activities in sidemenu" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 2: Listed activities in sidemenu</b>
    </figcaption>
</figure>

The side menu `<aside>` contains various activities [[Fig. 2]](#fig2) of an app:

* Active activities are displayed in bold and highlighted with a red vertical line on the left side[[Fig. 2]](#fig2)<br>
* In standard layout, the `<aside>` side menu switches to a dropdown menu[[Fig. 3]](#fig3) at the top of the screen at breakpoint 768px <br>
* In wide layout, the `<aside>` menu with all activities is already at the top<br>

<figure id="fig3" style="margin:0; ">
    <img src="../../assets/ui_images/dbp_ui_dropdown-navigation.svg" alt="Dropdownmenu with activities" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 3: Dropdownmenu with activities</b>
    </figcaption>
</figure>


## Activities

An activity [[Fig. 4]](#fig4)[[Fig. 5]](#fig5) follows the structure:<br>

1. H2 title (An activity should be named using a verb, because this emphasizes it being a real activity, something the user can do.)
2. Subtitle with ``class="subheadline"`` - Short explanation of the activity (**mandatory!**)
3. Intro Text - Overview of the activity if needed (optional)
4. Activity Stuff


<figure id="fig4" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_01.svg" alt="Basic activity GUI visualization" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 4: Basic activity GUI visualization</b>
    </figcaption>
</figure>

<figure id="fig5" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_06.svg" alt="Basic activity mobile GUI visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 5: Basic activity mobile GUI visualization</b>
    </figcaption>
</figure>



## UI Flow
The user interface always follows similar rules.
We distinguish between Informational views and click-through flow.

### Informational views
For **informational views**, all UI elements are weighted equally.
The user decides for themselves what they want to do next.
All buttons are then equivalent [[Secondary Button]](#secondary-button). The user is not guided through the activity/section.
Example: [Clipboardmanagement activity](https://dbp-demo.tugraz.at/apps/activity-showcase/de/clipboard){:target="_blank"} or see picture [Fig. 14](#fig14).

### Click-through flow
In the click-through flow you want to guide the user through an activity/an element.
The developer decides which steps are taken to "move forward".
This is achieved by setting a "call-to-action" [[Primary-Button]](#primary-button) button [[Fig. 15]](#fig15).
This button always marks the next step. How the button is set see [Buttons](#buttons).

## Layout and Grid System
### Layout Types

The dbp app supports two different layout types that users can switch between using the "layout switcher" icon <img src="../../assets/ui_images/layout.svg" alt="Icon for switching layouts" style="width:20px; margin: auto;"> in the main navigation:

#### Standard Layout 

* Default layout for all apps [[Fig.6]](#fig6)
* The side menu `<aside>` is positioned on the left side of the screen
* Main content area `<main>` occupies the remaining space – contains activities
* Optimized for navigation-heavy workflows where frequent access to the menu is needed
* At breakpoint 768px, the side menu `<aside>` moves to the top of the screen [[Fig.7]](#fig7)

<figure id="fig6" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_standardlayout.svg" alt="Standard layout desktop visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 6: Standard layout desktop visualization</b>
    </figcaption>
</figure>

<figure id="fig7" style="width:50%;">
    <img src="../../assets/ui_images/dbp_ui_standardlayout_responsive.svg" alt="Standard layout mobile visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 7: Standard layout mobile visualization</b>
    </figcaption>
</figure>

#### Wide Layout 

* Alternative layout that provides more horizontal space for content 
* The side menu `<aside>` is positioned at the top of the screen by default 
* Main content area `<main>` spans the full width below the `<aside>` navigation [[Fig.8]](#fig8)
* Optimized for content-heavy workflows where maximum screen real estate is needed (E.g: Cabinet – filter options)
* Maintains the same maximum content width (1400px) like the standard layout

<figure id="fig8" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_widelayout.svg" alt="Wide layout desktop visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 8: Wide layout desktop visualization</b>
    </figcaption>
</figure>

### Maximum Content Width
Maximum content width: 1400px. Regardless of standard layout or wide layout, a maximum width of 1400px must be set. This prevents texts or other elements from becoming too long to read or elements within the `<main>` column from being stretched too much.

<figure id="fig9" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_maxwidth.svg" alt="Maximum width visualization for the standard layout" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 9: Wide layout desktop visualization</b>
    </figcaption>
</figure>

## Responsive Design & Breakpoint Structure
<div id="main-bp"></div>
### Main breakpoints 

The apps should be developed so that adjustments are primarily made at the main breakpoints to ensure a consistent responsive design. Only in special exceptional cases can an[ additional breakpoint ](#add-bp)be used.

#### First main breakpoint: 768px (Tablet)
<figure id="fig10" style="width:50%; margin:0">
    <img src="../../assets/ui_images/dbp_ui_standardlayout_responsive.svg" alt="First main breakpoint at 768px" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 10: First main breakpoint at 768px</b>
    </figcaption>
</figure>

#### Second main breakpoint: 490px (Smartphone and below)
<figure id="fig11" style="width:25%; margin:0">
    <img src="../../assets/ui_images/dbp_ui_standard_490.svg" alt="Second main breakpoint at 490px" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 11: Second main breakpoint at 490px</b>
    </figcaption>
</figure>

<div id="add-bp"></div>

### Additional Breakpoints

If an activity design doesn't fit into the [main breakpoint scheme](#main-bp), these additional breakpoints should be implemented as intermediate solutions.
They serve exclusively as a supplement between the defined main breakpoints.

* 1100px for small laptops/screens
* 320px for the smallest smartphones [[See Mobile XS]](#320bp)



#### Example for using Additional Breakpoints
The Cabinet app uses the space within the `<main>` column for its filter options. This leads to a reduction of space for the actual content and also to a cut on smaller screens, especially in the standard layout, as seen in the case of hit boxes. [[Fig.12]](#fig12)

<figure id="fig12" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_cutLayout.svg" alt="1100px viewwith without additional breakpoint shows layout cuts" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 12: 1100px viewwith without additional breakpoint shows layout cuts</b>
    </figcaption>
</figure>

The filter options are the main purpose of this app to filter and display student documents and need to be available as long as possible. Therefore, an additional breakpoint of 1100px makes sense in the Cabinet app to move the `<aside>` menu up earlier (bp 1100px) than the first main breakpoint (768px - where this happens anyway) and keep the filter options visible on the screen longer without cuts in the layout as one can see in [[Fig.13]](#fig13). 

<figure id="fig13" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_additional-breakpoint.svg" alt="1100px viewwith as additional breakpoint shows no cuts in the layout" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 13: 1100px viewwith as additional breakpoint shows no cuts in the layout</b>
    </figcaption>
</figure>

<b>Side note:</b> In this case, making only the hit boxes responsive does not resolve the layout issue on smaller screens like 900px, 800px or even right before the first bp 768px. Therefore this additional breakpoint is nessesary.

### Breakpoint overview

#### Desktop ≥1400px
Standard- & wide layout with maximum content width of 1400px [[Fig. 9]](#fig9) [[Fig.10]](#fig10)

#### Small Laptops and Tablet Landscape (1100px)
Only implement if additional layout adjustments are required between 1400px and 768px [[Fig.13]](#fig13)

#### Tablet (768px)

* First main breakpoint for switching to tablet mode [[Fig. 10]](#fig10)
* Designs should be simply shrinkable until the second main breakpoint
* The `<aside>` column moves to the top so that the `<main>` column expands to its full width

#### Mobile (490px and smaller)

* Smallest breakpoint for all mobile devices and below [[Fig.11]](#fig11)
* Consideration of the smallest device (iPhone SE with 320px viewport width)

<div id="320bp"></div>

#### Mobile XS (320px small viewport)

As one implement responsive design in apps, one has to check for this breakpoint as the h2 tends to be too large for this view. Maybe small adjustments are needed here.

We currently try to target "iPhone SE 1st gen" as the lowest supported (CSS) resolution: 320 x 568

See https://www.ios-resolution.com, https://www.mydevice.io/#compare-devices and https://en.wikipedia.org/wiki/IPhone_SE_(1st_generation) for more information.

## UI Elements
### Buttons

#### One Button
If only one button is used, it is set aligned with the text in the current section.
E.g.: If the text is left-aligned, the button is left-aligned too. If the text is centered, the button will be centered too.
Exceptions to this are optically defined sections, such as a modal. Usually a single button is placed on the right.
Further information about modals see [modals](#modals).

#### Button Groups
Button groups can consist of buttons and text.
If text elements are used in button groups, they must be treated in the same way as buttons.

If there are several buttons in the UI, they are distributed evenly over the entire width of the section.
Buttons can also be combined into logical groups. (e.g. similar functions)
These logical groups are then not distributed but combined in one element (`div`) and this element is then distributed evenly with the other buttons. [[Fig. 14]](#fig14)

<figure id="fig14" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_04.svg" alt="Buttongroups" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 14: Buttongroups</b>
    </figcaption>
</figure>

#### Primary Button
A primary button has the css classes `button` and `is-primary`.
This button always denotes a "call-to-action" or "next-step" button, i.e. how to proceed in the UI.

<figure id="" style="width:18%; margin:0">
    <img src="../../assets/ui_images/is primary.svg" alt="primary buttons" style="width:100%; ">
</figure>

If a primary button is used in a button group, it is placed on the far right. [[Fig. 15]](#fig15)

#### Secondary Button
A secondary button has the css classes `button` and `is-secondary`.
This button is used for all actions which are not required for the flow. [[Fig. 15]](#fig15)

<figure id="" style="width:20%; margin:0">
    <img src="../../assets/ui_images/secondary_button.svg" alt="secondary buttons" style="width:100%;">
</figure>

<figure id="fig15" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_03.svg" alt="secondary and primary buttons" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 15: secondary and primary buttons</b>
    </figcaption>
</figure>


#### Buttons in responsive webdesign
In mobile views, buttons can be combined and reduced to an additional options-menu.
An additional-options menu is presented with a **kebab menu**[[Fig. 16]](#fig16) (three vertical aligned dots) and a dropdown menu [[Fig. 17]](#fig17). 
We use the `menu-dots` icon from our icon set for the **kebab menu**.
This is opened by clicking and the additional buttons are displayed there as entries in the dropdown list.

Buttons which contain text are expanded to the full width and have a min height of 40px. Buttons which contain icons have a width and height of 40px.
For more information see [Accessibility](./accessibility.md).

<figure id="fig16" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_13.svg" alt="Buttons hide behind an additional menu (kebab menu)" style="width:100%; border: 1px solid black; margin:auto;">
    <figcaption>
        <b>Fig. 16: Buttons hide behind an additional menu (kebab menu) on small devices</b>
    </figcaption>
</figure>

<figure id="fig17" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_12.svg" alt="Buttons are visible in dropdown menu" style="width:100%; border: 1px solid black;margin:auto;">
    <figcaption>
        <b>Fig. 17: Buttons are visible in dropdown menu on small devices</b>
    </figcaption>
</figure>

### Tables
We distinguish between tables with fix content [[Fig. 18]](#fig18) and datatables [[Fig. 20]](#fig20).

Depending on the operation area you can decide between endless scroll or pagination.
An example for endless scroll can be found in the [Nextcloud file picker Webcomponents](https://github.com/digital-blueprint/toolkit/tree/main/packages/file-handling/src/nextcloud-file-picker.js){:target="_blank"}.
An example for pagination can be found in [Formalize](https://github.com/digital-blueprint/formalize-app){:target="_blank"}.

If you have an endless scroll, you can also show up a `select all` button as it was done in the Nextcloud file picker Webcomponents.

If you have row action buttons you can distinguish between: selecting a row and connect these rows with a button, or
you can create a call to actions column in the last column of the table. The row action buttons can be placed there. E.g.: Open the row in Detail,
edit a row, delete a row...

The table footer only appears if you have pagination enabled. In this section, the pagination, the next/prev/last/first buttons and the actual page is shown.
This footer appears sticky in the table on mobile devices.

We are using [tabulator](http://tabulator.info/){:target="_blank"} for building our tables.

#### Tables with fix content

Tables with fix contents [[Fig. 18]](#fig18) are tables where we know the columns, where we can estimate the weight of these columns.
Because we can estimate the weight, we can collapse some columns on mobile devices [[Fig. 19]](#fig19) and the rest of the table can expand to full width.
These columns can be collapsed or expanded on these devices.
The collapse Icon is placed in the first column of the row.

<figure id="fig18" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_10.svg" alt="Table with fix and selectable content" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 18: Table with fix and selectable content</b>
    </figcaption>
</figure>

<figure id="fig19" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_14.svg" alt="Table with fix and selectable content on mobile devices" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 19: Table with fix and selectable content on mobile devices</b>
    </figcaption>
</figure>

#### Datatables

Tables with unknown Data or a high amount of data are datatables [[Fig. 20]](#fig20) [[Fig. 21]](#fig21). We don't know the weight of each column, so we can't collapse any of them.
We need a horizontal scroll and a short preview of a row. This is done with a "show in detail" button.
This button takes place in the last column - the action column.
The action column is frozen.

<figure id="fig20" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_11.svg" alt="Datatable" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 20: Datatable</b>
    </figcaption>
</figure>

<figure id="fig21" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_15.svg" alt="Datatable on mobile devices" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 21: Datatable on mobile devices</b>
    </figcaption>
</figure>

### Modals
We distinguish between detail Modals [[Fig. 22]](#fig22) and Modals with tabs [[Fig. 23]](#fig23).

We are using a tiny lib for building these modals: [micromodal](https://micromodal.vercel.app/){:target="_blank"}.

#### Detail Modal
A detail modal is used to view records as a whole or to get more details.
The modal has a title in the left upper corner and a close sign in the right upper corner [[Fig. 22]](#fig22).
The buttons are placed at the bottom of the modal dialogue.

An example for a detailed modal can be found in our application [Formalize](https://github.com/digital-blueprint/formalize-app){:target="_blank"}, where 
we used the detail modal to show a whole data entry row in a compact way.

<figure id="fig22" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_08.svg" alt="Detail Modal" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 22: Detail Modal</b>
    </figcaption>
</figure>

#### Modal with Tabs
If we have an additional Menu e.g. different locations for file-saving, then we can have tabs in the modal dialogue  [[Fig. 23]](#fig23).
These tabs are placed on the left side of the modal dialogue. On mobile devices these tabs are placed at the top of the screen.

We also have a modal title which indicates the context of this dialogue and a closing sign on the right upper corner.

An example for a modal with tabs can be found in the [file handling webcomponents](https://github.com/digital-blueprint/toolkit/tree/main/packages/file-handling/src/file-source.js){:target="_blank"}.

<figure id="fig23" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_09.svg" alt="Modal with Tabs" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 23: Modal with Tabs</b>
    </figcaption>
</figure>

#### X and cancel buttons
Each modal has a closing button marked with an "X" in the upper right corner. This button closes the modal.

If the modal requires user interaction (e.g. overwrite file, save filter, ...) then there must be an additional "Cancel" button and a "Save"/"Apply"/"OK" button.
The "Cancel" button interacts like the "X" button. It stops the active process and closes the modal. No changes are made. 
The "Save"/"Apply"/"OK" button saves the active changes and closes the modal.

If the modal is used for purely informative purposes (e.g.: preview, directory select, ...) the modal does not need a "Cancel" button.
However, an informal "OK" button may be provided to ensure once again that the user has read the information.

## States and Interaction Design

### Hover state
A hover state is not specified for either links or buttons. The interaction itself is displayed as an interaction (buttons look like buttons, links are underlined...), and another state like hover is not required yet.

Within the cabinet app when users interact with the "clear filters" option a spinning icon rotates and the link itself becomes underlined. This provides visual feedback that the filter reset action is being processed and confirms the interactive nature of the element.

### Active state

* <b>Active activities</b> in the side menu are highlighted with bold text and marked with a vertical, CD-colored line `--dbp-accent` on the left side. See [[Fig. 2]](#fig2)

<figure id="" style="width:15%; margin-left:20px">
    <img src="../../assets/ui_images/activeLink.svg" alt="active link" style="width:100%;">
</figure>
<div id="toggle-switch"></div>
* <b>Toggle switches</b> are turned off by default with the `--dbp-muted` color. When activated, the color changes to `--dbp-info`. 
<figure id="" style="width:12%;  margin-left:20px">
    <img src="../../assets/ui_images/toggleswitch.png" alt="toggle switch buttons" style="width:100%;">
</figure>


### Focus
Currently, no focus is defined. At the moment, it is the browser default focus, whose attention is not so strong due to the blue corporate design of the dbp. A more emphasized focus is recommended thought.

### Disabled state
Elements in a disabled state are grayed out (color: `dbp-secondary-surface`; opacity: 0.4;) so they remain visually recognizable but are not interactive. This can apply to buttons or links that are temporarily inaccessible. For example, in Formalize, when not all fields have been filled out, the submission button remains in a disabled state. Only when all required information has been provided is the disabled state removed.

<figure id="" style="width:18%;  margin:0">
    <img src="../../assets/ui_images/disabled_state.svg" alt="disabled state button" style="width:100%;">
</figure>

### Loading state
The loading state is indicated by a spinning icon that shows a loading process is occurring, without indicating the loading time. 

See also: [Toolkit-Showcase > Mini Spinner](https://dbp-dev.tugraz.at/apps/toolkit-showcase/de/common)

### Feedback

Since there is no hover state, the only feedback state is that links function as expected and the interaction is completed - a new window opens or a modal is closed. The successful execution of the action itself serves as feedback to the user.

For toggle buttons, feedback is provided through color changes [[See toggle switcher]](#toggle-switch): when toggled off, the button appears in `color: --dbp-muted`; when toggled on, it changes to `--dbp-info` green. Additionally, toggle buttons include a small animation of a slider moving from the "On" to "Off" position and vice versa, providing clear visual feedback about the state change.

### Error Handling
All errors appear in the `--dbp-danger` color. An error is always displayed with a meaningful error message and it must be clear where the error occurs. The following example shows the app esign [Fig.24]


<figure id="fig24" style="width:100%;">
    <img src="../../assets/ui_images/error_handling_esign.png" alt="An highlighted error occurs in the App esign" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 24: An highlighted error occurs in the App esign</b>
    </figcaption>
</figure>


## Animations

### Toggle Switch Animation
When changing between On/Off states, the toggle button slides smoothly to indicate the state transition.

### Modal Animation
Modals open instantaneously as popup overlays without any transition.

### Responsive Side-Menu Animation
In responsive design, side menus (such as the Cabinet filter-modal) slide from left to right into the window as an extra panel/submenu, particularly for filter options in the Cabinet app. After selecting filters there, users can close the model with the X icon, it slides back outside the viewport.

### Loading Animation
The spinning icon that appears during loading processes is also considered an animation element, providing visual feedback during wait times.

### Filter Interaction Animation
When users interact with the "Reset Filter Option" in Cabinet app by selecting "clear filters," a spinning icon rotates and the link itself becomes underlined. 



## Colors
DBP Apps have declared different CSS variables. You should avoid using hard coded colors or borders. 
Instead, use these CSS variables. 
You can find a brief description of the color system and the variables at the [theming page](../user/styling.md#color-system).

CSS variables are accessed using the `var()` function.
You can use all of these CSS variables without the 'override' in the code. E.g.: if you want to use
`--dbp-override-accent` as a font color, you can use it in your code like
```css
.any-selector {
  color: var(--dbp-accent);
}
```
The  css variables with the `override` prefix are for integrators and explicit for the `index.html`. 
The css variables in the `index.html` *overrides* the internal variables without the prefix `override`. 
So multiple themes can be mapped to one variable and the css variables can internal used without the `override` prefix.

Further information about CSS variables in general can be found at [developer.mozilla.org](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties){:target="_blank"}.

## Fontsize
You should not use a font size smaller than 16 CSS px. You should also avoid absolut units, use relative, like em, rem instead.
Read more in the [Accessibility guide](./accessibility.md#fontsize).


## Accessibility Guidelines 

Regarding design and structure, you must ensure WCAG 2.1 AA compliance for all DBP applications. The following accessibility requirements are mandatory for all UI implementations. For detailed guidelines, refer to the [Accessibility guide](./accessibility.md):

Table of Content: 

* [Keyboard-friendly ](./accessibility.md#keyboard-friendly)
* [Colors & Minimal Contrast Level ](./accessibility.md#colors-minimal-contrast-level)
  * [Minimal Contrast Level ](./accessibility.md#minimal-contrast-level)
  * [Include a Text or Icon cue for colored information ](./accessibility.md#include-a-text-or-icon-cue-for-colored-information)
* [Fontsize ](./accessibility.md#fontsize)
* [Touchtarget Size](./accessibility.md#touchtarget-size)
* [Hierarchy of Headlines ](./accessibility.md#hierarchy-of-headlines)
* [Text alternatives](./accessibility.md#text-alternatives) 
  * [Non Text content: ALT attribute ](./accessibility.md#non-text-content-alt-attribute)
  * [Link titles ](./accessibility.md#link-titles)
  * [Labels for User input](./accessibility.md#labels-for-user-input)

