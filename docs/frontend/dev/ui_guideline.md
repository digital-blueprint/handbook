# UI Guidelines
In this guide we discover these topics:

- [Activity UI Guide](#activity-ui-guide)
- [UI Flow](#ui-flow)
    -  [Informational views](#informational-views)
    - [Click-through flow](#click-through-flow)
- [UI Elements](#ui-elements)
    - [Buttons](#buttons)
    - [Tables](#tables)
    - [Modals](#modals)
- [Colors](#colors)
- [Fontsize](#fontsize)
- [And more](#and-more-to-consider)
  

## Activity UI Guide

An Activity follows the order [[Fig. 1]](#fig1)[[Fig. 2]](#fig2):

1. H2 title 
2. Subtitle with ``class="subheadline"`` - Short explanation of the activity
3. Intro Text - Overview of the activity if needed (Optional)
4. Activity Stuff


<figure id="fig1" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_01.svg" alt="Basic activity GUI visualization" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 1: Basic activity GUI visualization</b>
    </figcaption>
</figure>

<figure id="fig2" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_06.svg" alt="Basic activity mobile GUI visualization" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 2: Basic activity mobile GUI visualization</b>
    </figcaption>
</figure>

## UI Flow
The user interface always follows similar rules.
We distinguish between Informational views and Click-through flow.

### Informational views
For **informational views**, all UI elements are weighted equally.
The user himself must decide what he wants to do next.
All buttons are then equivalent [[Secondary Button]](#secondary-button). The user is not guided through the activity/section.
E.g.: [Clipboardmanagement activity](https://dbp-demo.tugraz.at/apps/common/de/clipboard){:target="_blank"} or see picture [Fig. 7](#fig9).

### Click-through flow
In the click-through flow you want to guide the user through an activity/an element.
The developer decides which steps are taken to "move forward".
This is achieved by setting a "call-to-action" [[Primary-Button]](#primary-button) button [[Fig. 3]](#fig3).
This button always marks the next step. How the button is set see [Buttons](#buttons).


## UI Elements
### Buttons

#### One Button
If only one button is used, it is set aligned with the text in the current section.
E.g.: If the text is left-aligned, the button is left-aligned. If the text is centered, the button will be centered.
Exceptions to this are optically defined sections, such as a modal. Usually a single button is placed on the right.
Further information about modals see [modals](#modals).

#### Button Groups
Button groups can consist of buttons and text.
If text elements are used in button groups, they must be treated in the same way as buttons.

If there are several buttons in the UI, they are distributed evenly over the entire width of the section.
Buttons can also be combined into logical groups. (e.g. similar functions)
These logical groups are then not distributed but combined in one element (`div`) and this element is then distributed evenly with the other buttons. [[Fig. 3]](#fig3)

<figure id="fig3" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_04.svg" alt="Buttongroups" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 3: Buttongroups</b>
    </figcaption>
</figure>

#### Primary Button
A primary button has the css classes `button` and `is-primary`.
This button always denotes a "call-to-action" or "next-step" button, i.e. how to proceed in the UI.

If a primary button is used in a button group, it is placed on the far right. [[Fig. 4]](#fig4)

#### Secondary Button
A secondary button has the css classes `button` and `is-secondary`.
This button is used for all actions which are not required for the flow. [[Fig. 4]](#fig4)

<figure id="fig4" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_03.svg" alt="secondary and primary buttons" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 4: Secondary and primary buttons</b>
    </figcaption>
</figure>

#### Responsive Webdesign
In mobile views, buttons can be combined and reduced to an additional options-menu.
An additional-options menu is presented with a **kebab menu**[[Fig. 5]](#fig5) (three vertical aligned dots) and a dropdown menu [[Fig. 6]](#fig6). 
We use the `menu-dots` icon from our icon set for the **kebab menu**.
This is opened by clicking and the additional buttons are displayed there as entries in the dropdown list.

Buttons which contain text are expanded to the full width and have a min height of 40px. Buttons which contain icons have a width and height of 40px.
For more information see [Accessibility](/../frontend/dev/accessibility/).

<figure id="fig5" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_13.svg" alt="Buttons hide behind an additional menu (kebab menu)" style="width:100%; border: 1px solid black; margin:auto;">
    <figcaption>
        <b>Fig. 5: Buttons hide behind an additional menu (kebab menu) on small devices</b>
    </figcaption>
</figure>

<figure id="fig6" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_12.svg" alt="Buttons are visible in dropdown menu" style="width:100%; border: 1px solid black;margin:auto;">
    <figcaption>
        <b>Fig. 6: Buttons are visible in dropdown menu on small devices</b>
    </figcaption>
</figure>

### Tables
We distinguish between tables with fix content [[Fig. 7]](#fig7) and datatables [[Fig. 9]](#fig9).

Depending on the operation area you can decide between endless scroll or pagination.
An example for endless scroll can be found in the [Nextcloud file picker Webcomponents](https://gitlab.tugraz.at/dbp/web-components/toolkit/-/blob/master/packages/file-handling/src/nextcloud-file-picker.js){:target="_blank"}.
An example for pagination can be found in [Formalize](https://gitlab.tugraz.at/dbp/formalize/formalize){:target="_blank"}.

If you have an endless scroll, you can also show up a `select all` button as it was done in the Nextcloud file picker Webcomponents.

If you have row action buttons you can distinguish between: selecting a row and connect these rows with a button, or
you can create a call to actions column in the last column of the table. The row action buttons can be placed there. E.g.: Open the row in Detail,
edit a row, delete a row...

The table footer only appears if you have pagination enabled. In this section, the pagination, the next/prev/last/first buttons and the actual page is shown.
This footer appears sticky in the table on mobile devices.

We are using [tabulator](http://tabulator.info/){:target="_blank"} for building our tables.

#### Tables with fix content

Tables with fix contents [[Fig. 7]](#fig7) are tables where we know the columns, where we can estimate the weight of these columns.
Because we can estimate the weight, we can collapse some columns on mobile devices [[Fig. 8]](#fig8) and the rest of the table can expand to full width.
These columns can be collapsed or expanded on these devices.
The collapse Icon is placed in the first column of the row.

<figure id="fig7" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_10.svg" alt="Table with fix and selectable content" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 7: Table with fix and selectable content</b>
    </figcaption>
</figure>

<figure id="fig8" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_14.svg" alt="Table with fix and selectable content on mobile devices" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 8: Table with fix and selectable content on mobile devices</b>
    </figcaption>
</figure>

#### Datatables

Tables with unknown Data or a high amount of data are datatables [[Fig. 9]](#fig9) [[Fig. 10]](#fig10). We don't know the weight of each column, so we can't collapse any of them.
We need a horizontal scroll and a short preview of a row. This is done with a "show in detail" button.
This button takes place in the last column - the action column.
The action column is frozen.

<figure id="fig9" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_11.svg" alt="Datatable" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 9: Datatable</b>
    </figcaption>
</figure>

<figure id="fig10" style="width:50%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_15.svg" alt="Datatable on mobile devices" style="width:100%; border: 1px solid black; margin: auto;">
    <figcaption>
        <b>Fig. 10: Datatable on mobile devices</b>
    </figcaption>
</figure>

### Modals
We distinguish between detail Modals [[Fig. 11]](#fig11) and Modals with tabs [[Fig. 12]](#fig12).

We are using a tiny lib for building these modals: [micromodal](https://micromodal.vercel.app/){:target="_blank"}.

#### Detail Modal
A detail modal is used to view records as a whole or to get more details.
The modal has a title in the left upper corner and a close sign in the right upper corner [[Fig. 11]](#fig11).
The buttons are placed at the bottom of the modal dialogue.

An example for a detailed modal can be found in our application [Formalize](https://gitlab.tugraz.at/dbp/formalize/formalize){:target="_blank"}, where 
we used the detail modal to show a whole data entry row in a compact way.

<figure id="fig11" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_08.svg" alt="Detail Modal" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 11: Detail Modal</b>
    </figcaption>
</figure>

#### Modal with Tabs
If we have an additional Menu e.g. different locations for file-saving, then we can have tabs in the modal dialogue  [[Fig. 12]](#fig12).
These tabs are placed on the left side of the modal dialogue. On mobile devices these tabs are placed at the top of the screen.

We also have a modal title which indicates the context of this dialogue and a closing sign on the right upper corner.

An example for a modal with tabs can be found in the [file handling webcomponents](https://gitlab.tugraz.at/dbp/web-components/toolkit/-/blob/master/packages/file-handling/src/file-source.js){:target="_blank"}.

<figure id="fig12" style="width:100%;">
    <img src="../../assets/ui_images/DBP-UI-Design_page_09.svg" alt="Modal with Tabs" style="width:100%; border: 1px solid black;">
    <figcaption>
        <b>Fig. 12: Modal with Tabs</b>
    </figcaption>
</figure>

#### X and cancel buttons
Each modal has a closing button marked with an "X" in the upper right corner. This button closes the modal.

If the modal requires user interaction (e.g. overwrite file, save filter, ...) then there must be an additional "Cancel" button and a "Save"/"Apply"/"OK" button.
The "Cancel" button interacts like the "X" button. It stops the active process and closes the modal. No changes are made. 
The "Save"/"Apply"/"OK" button saves the active changes and closes the modal.

If the modal is used for purely informative purposes (e.g.: preview, directory select, ...) the modal does not need a "Cancel" button.
However, an informal "OK" button may be provided to ensure once again that the user has read the information.

## Colors
DBP Apps have declared different CSS variables. You should avoid using hard coded colors or borders. 
Instead, use these CSS variables. 
You can find a brief description of the color system and the variables at the [theming page](../../theming/#color-system).

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
Read more in the [Accessibility guide](../accessibility/#fontsize).

## And more to consider
Regarding design and structure you have considering much more. You can find a short overview in the [Accessibility guide](../accessibility/).
