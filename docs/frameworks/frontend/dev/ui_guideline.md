# UI Guidelines
These guidelines serve as a reference for developers of the digital blueprint app. They ensure that all components and layouts are designed consistently and provide a unified user experience. The covered topics can be found in the table of contents on the right

## App Shell

The App Shell is the fundamental structure of a digital blueprint application that loads first before any content. It provides the consistent framework within which all activities are displayed, ensuring a unified user experience across the entire application.

The App Shell consists of three main components:

1. Header `<header>` - Contains the main navigation elements [[Fig. 1]](#fig1)
2. Side Menu `<aside>` - Houses the activity navigation [[Fig. 2]](#fig2)
3. Main Content Area `<main>` - Displays the current activity content [[Fig.6]](#fig6)

### App Shell Behavior
#### Loading State
The App Shell loads first, providing immediate visual feedback to users while the activity content is being loaded.

#### Responsive Behavior

* Full App Shell with maximum content width of 1400px, using this layout by default
* At the breakpoint of 870px (and below) the application automatically switches to wide layout (the layout switcher is no longer available)

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
* In standard layout, the `<aside>` side menu switches to a dropdown menu[[Fig. 3]](#fig3) at the top of the screen at breakpoint 870px <br>
* In wide layout, the `<aside>` menu with all activities is already at the top<br>

<figure id="fig3" style="margin:0; ">
    <img src="../../assets/ui_images/dbp_ui_dropdown-navigation.svg" alt="Dropdownmenu with activities" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 3: Dropdownmenu with activities</b>
    </figcaption>
</figure>


## Activities

An activity [[Fig. 4]](#fig4)[[Fig. 5]](#fig5) follows the structure:<br>

1. H2 activity name as title (An activity should be named with a verb, as this emphasizes that it is an actual activity, something the user can do)
3. Optional subtitle with class="subheadline" - Brief explanation of the activity
4. Introductory text - Overview of the activity, if necessary (optional)
5.	Activity contents


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
We distinguish between information views and click-through flow.

### Informational views
For **informational views**, all UI elements are weighted equally.
The user decides for themselves what they want to do next.
All buttons are then equivalent [[Secondary Button]](#secondary-button). The user is not guided through the activity/section.
Example: [Clipboardmanagement activity](https://dbp-demo.tugraz.at/apps/activity-showcase/de/clipboard){:target="_blank"} or see picture [Fig. 10](#fig10).

### Click-through flow
In the click-through flow you want to guide the user through an activity/an element.
The developer decides which steps are taken to "move forward".
This is achieved by setting a "call-to-action" [[Primary-Button]](#primary-button) button [[Fig. 11]](#fig11).
This button always marks the next step. How the button is set see [Buttons](#buttons).

## Layout and Grid System
### Layout Types

The dbp app supports two different layout types that users can switch between using the "layout switcher" icon <img src="../../assets/ui_images/layout.svg" alt="Icon for switching layouts" style="width:20px; margin: auto;"> 
in the main navigation. When the viewport shrinks down to 870px the layout automatically changes to „wide“ layout over all apps and the layout switcher disappears. The layout switcher is only available in the desktop view above 870px. 

#### Standard Layout 

* ·	Default layout for all apps in desktop view until 870px view width [[Fig.6]](#fig6)
* The side menu `<aside>` is positioned on the left side of the screen
* Main content area `<main>` occupies the remaining space – contains activities
* Optimized for navigation-heavy workflows where frequent access to the menu is needed
* At breakpoint 870px, the layout changes automatically to wide layout and the layout switcher (and therefore the standard layout) is not available anymore. 

<figure id="fig6" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_standardlayout.svg" alt="Standard layout desktop visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 6: Standard layout desktop visualization</b>
    </figcaption>
</figure>


#### Wide Layout 

* An alternative layout for the desktop view above 870px that provides more horizontal space for content. The content is enlarged to it’s full width of 1400px
* Default layout at 870px [[Fig.8]](#fig8)
* The side menu `<aside>` is positioned at the top of the screen by default 
* Main content area `<main>` spans the full width below the `<aside>` navigation [[Fig.7]](#fig7)
* Optimized for content-heavy workflows where maximum screen real estate is needed (E.g: Cabinet – filter options)

<figure id="fig7" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_widelayout.svg" alt="Wide layout desktop visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 7: Wide layout visualization</b>
    </figcaption>
</figure>

### Maximum Content Width
Maximum content width is 1400px. Regardless of standard layout or wide layout, a maximum width of 1400px must be set. This prevents texts or other elements from becoming too long to read or elements within the `<main>` column from being stretched too much.

## Breakpoint Structure & responsive behavior
<div id="main-bp"></div>
The apps should be developed so that adjustments are primarily made at the two breakpoints to ensure a consistent responsive design. 

### First breakpoint: 870px (Tablet)
<figure id="fig8" style="width:50%; margin:0">
    <img src="../../assets/ui_images/dbp_ui_standardlayout_responsive.svg" alt="First main breakpoint at 870px" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 8: First main breakpoint at 870px</b>
    </figcaption>
</figure>


### Second  breakpoint: 490px (Smartphone and below)
<figure id="fig9" style="width:25%; margin:0">
    <img src="../../assets/ui_images/dbp_ui_standard_490.svg" alt="Second main breakpoint at 490px" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 9: Second main breakpoint at 490px</b>
    </figcaption>
</figure>

### Responsive overview

#### Desktop ≥1400px
Standard- & wide layout with maximum content width of 1400px [[Fig. 6]](#fig6) [[Fig.7]](#fig7)


#### Tablet (870px)

* First breakpoint [[Fig. 8]](#fig8)
* Designs should be simply shrinkable until the second main breakpoint
* The `<aside>` column moves to the top so that the `<main>` column expands to its full width

#### Mobile (490px and smaller)

* Smallest breakpoint for all mobile devices and below [[Fig.9]](#fig9)
* Consideration of the smallest device (iPhone SE with 320px viewport width)

<div id="320bp"></div>

#### Mobile XS (320px smallest viewport)

As one implement responsive design in apps, one has to check some elements for this breakpoint as the h2 tends to be too large for this view, regarding long words.

We currently try to target "iPhone SE 1st gen" as the lowest supported (CSS) resolution: 320 x 568

See https://www.ios-resolution.com, https://www.mydevice.io/#compare-devices and https://en.wikipedia.org/wiki/IPhone_SE_(1st_generation) for more information.

## UI Elements

### Icons

Icons in the DBP app are classified into three main categories based on their function and interaction requirements: decorative icons, interactive icons, and interactive buttons with icon+text.
*	Decorative icons 
*	Interactive icons: They will always stand alone and are only used, if there is no space for icon+text button eg. [see Fig. 14 Datatables](#fig14)
*	Buttons with icon+text is always the first choice


### Color of Icons
Icons have to be set in the `var(--dbp-on-secondary-surface)` color. Inverted version of any icons (like in primary buttons or in dark mode) the icons get `var(--dbp-on-secondary-surface)` color. 
The only exception can be chevrons and closing icon in modals – only those two can have the color: `var(--dbp-accent)`. 

### Decorative icons
Decorative icons are not intended for interaction and therefore do not need to be used. Rather, they may be used as visual aids, but this is not mandatory. However, if they are to be used, they must appear before a headline, so their size depends on the font size of the title. There are no restrictions on the complexity of the icon. 


### Usage 
To choose the right icon for a button, look at the text. How the matching icon for a button is selected always depends on the verb that specifies the action. 
Example: “Edit mode” contains the verb “edit”. Chose a matching icon for that verb. From the moment a verb is used, it must also be used for the same verb across all apps in the future.
<img src="../../assets/ui_images/dbp_ui_edit-mode.svg" alt="Button for edit mode" style=""> So, editing will always be represented by a pencil for any actions.
However, there must never be two buttons with the same icon near each other. In the event that two identical icons need to be used, a new icon must be selected. The icon for the verb has always be included in the new icon. 
Example: “Edit mode  <img src="../../assets/ui_images/dbp_ui_edit-mode.svg" alt="Button for edit mode" style=""> ” and “Edit permission <img src="../../assets/ui_images/dbp_ui_edit-permission.svg" alt="Button for edit permission" style=""> “. Both of them contains a pencil icon, but the icon for “Edit permission” was adjusted for this specific case. From now on, „Edit permission“ will always be represented by this icon also using the pencil in combination. 

### Buttons with Icon + Text
A button in the GUI must always consist of an icon + text. The icon size within a button is 22 x 22px. 
The text describes the action using a verb and optionally a noun to specify it. Buttons without icons are not allowed to place. A buttons text always start with a capital letter. 
When implementing icons, always ensure accessibility by providing appropriate alt text and aria-attributes. Icons must maintain consistent sizing and styling throughout the application. 

### Interactive icons
Interactive icons are functional elements that the user can click or tap to perform actions. These icons appear only when there is no more space for the entire button [see buttons with icon+text]. Example: in tables or mostly in mobile view.

### Icon size
<div id="icon-size"></div>
Although the icons in the buttons are 22 x 22px in size, they are displayed larger when they stand alone. The touch targetsize should always have 40 x 40px in size while the icon inside can have the size between 22 x 22px and 24 x 24px (depending on the readability of the symbol) <img src="../../assets/ui_images/dbp_ui_icon-size.svg" alt="minimum size of icons" style="width:100%; border: 1px solid black;"> 

### Buttons
A button always consists of an icon and a text. The text describes the action using a verb and optionally a noun to specify it. Buttons without icons may not be placed.
The button size is determined by the padding of 4px 13px and the length of its descriptive text. If several buttons next to each other take up too much space for them to have, then all buttons within this buttongroup [see [[Fig. 10]](#fig10) Button groups] become icons only. Further information about icons and sizing see [Icon size](#icon-size).


#### Single Button
If only one button is used, it is set aligned with the text in the current section.
E.g.: If the text is left-aligned, the button is left-aligned too. If the text is centered, the button will be centered too.
Exceptions to this are optically defined sections, such as a modal. Usually a single button is placed on the right.
Further information about modals see [modals](#modals).

#### Button Groups
Button groups can consist of buttons and text.
If text elements are used in button groups, they must be treated in the same way as buttons.

If there are several buttons in the UI, they are distributed evenly over the entire width of the section.
Buttons can also be combined into logical groups. (e.g. similar functions)
These logical groups are then not distributed but combined in one element (`div`) and this element is then distributed evenly with the other buttons. [[Fig. 10]](#fig10)

<figure id="fig10" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_04.svg" alt="Buttongroups" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 10: Buttongroups</b>
    </figcaption>
</figure>

#### Primary Button
A primary button has the css classes `button` and `is-primary`.
This button always denotes a "call-to-action" or "next-step" button, i.e. how to proceed in the UI.

<figure id="" style="width:18%; margin:0">
    <img src="../../assets/ui_images/dbp_ui_primary.svg" alt="primary buttons" style="width:100%; ">
</figure>

If a primary button is used in a button group, it is placed on the far right. [[Fig. 11]](#fig11)

#### Secondary Button
A secondary button has the css classes `button` and `is-secondary`.
This button is used for all actions which are not required for the flow. [[Fig. 11]](#fig11)

<figure id="" style="width:20%; margin:0">
    <img src="../../assets/ui_images/dbp_ui_secondary.svg" alt="secondary buttons" style="width:100%;">
</figure>

<figure id="fig11" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_03.svg" alt="secondary and primary buttons" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 11: secondary and primary buttons</b>
    </figcaption>
</figure>



#### Buttons in responsive webdesign
In the mobile view, buttons remain buttons with icons + text, unless there is insufficient space. In this case, the buttons become icon only interaction. In other cases, buttons with icon + text are expanded to full width and have a minimum height of 40px. 

For more information see [Accessibility](./accessibility.md).


## Tables
We distinguish between tables with fix content [[Fig. 12]](#fig12) and datatables [[Fig. 13]](#fig13).

Depending on the operation area you can decide between endless scroll or pagination.
An example for endless scroll can be found in the [Nextcloud file picker Webcomponents](https://github.com/digital-blueprint/toolkit/tree/main/packages/file-handling/src/nextcloud-file-picker.js){:target="_blank"}.
An example for pagination can be found in [Formalize](https://github.com/digital-blueprint/formalize-app){:target="_blank"}.

We are using [tabulator](http://tabulator.info/){:target="_blank"} for building our tables.

### Tables with fix content

Tables with fix contents [Fig. 12](#fig12) are tables where we know the amount of columns before, where we can estimate the weight of these columns. Because we can estimate the weight, we can collapse some columns on mobile devices [Fig. 13](#fig15) and the rest of the table can expand to full width. These columns can be collapsed or expanded on these devices. The collapse Icon is placed in the first column of the row.


<figure id="fig12" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_10.svg" alt="Table with fix and selectable content" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 12: Table with fix and selectable content</b>
    </figcaption>
</figure>

<figure id="fig13" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_14.svg" alt="Table with fix and selectable content on mobile devices" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 13: Table with fix and selectable content on mobile devices</b>
    </figcaption>
</figure>

### Datatables

Tables with unknown Data or a high amount of data are datatables [Fig. 14](#fig14) [Fig. 15](#fig15). We don't know the weight of each column, so we can't collapse any of them. We need a horizontal scroll and a short preview of a row. This is realized with an icon only button at the very end of the row -in the last column, where all row actions are located. This column is the frozen part which is fixed/sticky.

<figure id="fig14" style="width:100%;">
    <img src="../../assets/ui_images/dbp_ui_datatable.svg" alt="Datatable" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 14: Datatable</b>
    </figcaption>
</figure>

<figure id="fig15" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_15.svg" alt="Datatable on mobile devices" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 15: Datatable on mobile devices</b>
    </figcaption>
</figure>

#### Table title
The table title uses an `<h3>` tag. Beware that the headline follows always the heading hierarchy, therefore a `<h2>` tag has to be used before for accessibility reasons. 
The styling of the table title is always `font-size: 1.17 em; 3px solid var(--dbp-primary)`; [See Fig. 16](#fig16)


#### table actions
Table actions are displayed as buttons above the table. The button opens a drop-down menu with all possible actions. These actions apply to the entire table unless one or more rows are selected, in which case the actions only apply to the selected rows. Example: If nothing is selected, all elements are affected. If some rows are selected, the table action only affects those rows. 

<figure id="fig16" style="width:50%;">
    <img src="../../assets/ui_images/dbi-ui-table-title_actions-dropdown.png" alt="Table title and action dropdown example for tables" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 16: Table title and action dropdown example for tables</b>
    </figcaption>
</figure>

#### Table Searchbar 
The search bar in the table is a magnifying glass icon that can be expanded to reveal text search and advanced search parameters. The advanced search options allow you to narrow down your search by column name and operators. 

<figure id="fig17" style="width:50%;">
    <img src="../../assets/ui_images/dbp-ui-searchbar.svg" alt="Searchbar" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Searchbar</b>
    </figcaption>
</figure>

#### Export dropdown
To export table data to other formats, there is an export button on the far right. This opens a drop-down menu with all further export settings. 

<figure id="fig18" style="width:50%;">
    <img src="../../assets/ui_images/dbp-ui-export-dropdown.png" alt="Export dropdown example for tables 
" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Export dropdown example for tables 
</b>
    </figcaption>
</figure>


#### Table Body / Table Header / Colhead
The entire table has a three-column structure: left, centre and right columns. [See Fig.14](#fig14) The left and right columns are always fixed and therefore visible at all times. The middle section contains the tabledata can be scrolled horizontally and disappears under the sticky parts.  
The left column always consists of a column with a checkbox and a column ID.
The right-hand column contains an optional column settings icon in the table header as well as the individual row actions in the form of icon buttons. 

#### Rows and row actions
Each row has its own actions at the very end of the table in the last column. These row actions specifically target only one data row and is represented by an icon only interaction. These icons will always be sticky. One of them is always a preview icon, which opens a modal window with an overview of the individual table entry. 

#### Table Footer
The table footer contains a text field  that displays the total number(n) of table entries when nothing is selected “ 0 / n “. This text expands as soon as individual entries are selected. The text then reads “ x / n ”.
If a table contains more than 10 entries, pagination is displayed centred in the footer, but has to be activated. It displays the pagination, the buttons for Next/Previous/Last/First, and the current page. This footer appears fixed in the table on mobile devices.

### Modals
We distinguish between detail Modals [[Fig. 19]](#fig19) and Modals with tabs [[Fig. 20]](#fig20).

We are using a tiny lib for building these modals: [micromodal](https://micromodal.vercel.app/){:target="_blank"}.

#### Detail Modal
A detail modal is used to view records as a whole or to get more details.
The modal has a title in the left upper corner and a close sign in the right upper corner [[Fig. 19]](#fig19).
The buttons are placed at the bottom of the modal dialogue.

An example for a detailed modal can be found in our application [Formalize](https://github.com/digital-blueprint/formalize-app){:target="_blank"}, where 
we used the detail modal to show a whole data entry row in a compact way.

<figure id="fig19" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_08.svg" alt="Detail Modal" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 19: Detail Modal</b>
    </figcaption>
</figure>

#### Modal with Tabs
If we have an additional Menu e.g. different locations for file-saving, then we can have tabs in the modal dialogue  [[Fig. 20]](#fig20).
These tabs are placed on the left side of the modal dialogue. On mobile devices these tabs are placed at the top of the screen.

We also have a modal title which indicates the context of this dialogue and a closing sign on the right upper corner.

An example for a modal with tabs can be found in the [file handling webcomponents](https://github.com/digital-blueprint/toolkit/tree/main/packages/file-handling/src/file-source.js){:target="_blank"}.

<figure id="fig20" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_09.svg" alt="Modal with Tabs" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 20: Modal with Tabs</b>
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

* <b>Active activities</b> in the side menu are highlighted with bold text and marked with a vertical, CD-colored line `--dbp-accent` on the left side. See [Fig.2](#fig2)

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
Notification banner and error handling 
Notification banners are messages displayed at the top of the screen to provide information, indicate success, show status updates, or report errors. They can be closed manually using an “X” button and may also include a countdown timer, which can be configured as needed.
Errors can also be displayed within a notification banner. In this case, the banner includes a clear error message along with the relevant data. 

An error is always displayed with a meaningful error message and the 'warning-high.svg' icon in the color: `var(--dbp-danger-surface-border-color)`.  


<figure id="fig21" style="width:100%;">
    <img src="../../assets/ui_images/error_handling_esign.png" alt="An highlighted error occurs in the App esign" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 21: An highlighted error occurs in the App esign</b>
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

