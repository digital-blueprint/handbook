# UI Guidelines
In this guide we discover these topics:

- [Acticity UI Guide](#activity-ui-guide)
- [UI Flow](#ui-flow)
    -  [Informational views](#informational-views)
    - [Click-through flow](#click-through-flow)
- [UI Elements](#ui-elements)
    - [Buttons](#buttons)
    - [Tables](#tables)
    - [Modals](#modals)
  

## Activity UI Guide

An Activity follows the order:

1. H2 title 
2. Subtitle with ``class="subheadline"`` - Short explanation of the activity
3. Intro Text - Overview of the activity if needed (Optional)
4. Activity Stuff


<figure>
    <img src="/dev-guide/frontend/assets/ui_images/Appshell.png" alt="Appshell Slots" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Appshell slots visualization</b>
    </figcaption>
</figure>

<figure>
    <img src="/dev-guide/frontend/assets/ui_images/Appshell_mobile.png" alt="Appshell Slots mobile" style="width:50%; border: 1px solid black; margin: auto;">
    <figcaption align = "center">
        <b>Appshell slots mobile visualization</b>
    </figcaption>
</figure>

## UI Flow

The user interface always follows similar rules.
We distinguish between Informational views and Click-through flow.

### Informational views
For **informational views**, all UI elements are weighted equally.
The user himself must decide what he wants to do next.
All buttons are then equivalent ([Secondary Button](#secondary-button)). The user is not guided through the activity/section.
E.g.: Clipboardmanagement activity or see picture [Datatable](#datatable).

### Click-through flow
In the click-through flow you want to guide the user through an activity/an element.
The developer decides which steps are taken to "move forward".
This is achieved by setting a "call-to-action"([Primary-Button](#primary-button)) button.
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
These logical groups are then not distributed but combined in one element (`div`) and this element is then distributed evenly with the other buttons.
See [buttongroups](#buttongroups).

<figure id="buttongroups">
    <img src="/dev-guide/frontend/assets/ui_images/Activity_UI_flow_3.png" alt="Buttongroups" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Buttongroups</b>
    </figcaption>
</figure>

#### Primary Button
A primary button has the css classes `button` and `is-primary`.
This button always denotes a "call-to-action" or "next-step" button, i.e. how to proceed in the UI.

If a primary button is used in a button group, it is placed on the far right.

#### Secondary Button
A secondary button has the css classes `button` and `is-secondary`.
This button is used for all actions which are not required for the flow.
See [secondary and primary buttons](#secondary-and-primary-buttons).

<figure id="secondary-and-primary-buttons">
    <img src="/dev-guide/frontend/assets/ui_images/Activity_UI_flow_3_v2.png" alt="secondary and primary buttons" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Secondary and primary buttons</b>
    </figcaption>
</figure>

#### Responsibility
In mobile views, buttons can be combined and reduced to an additional actions menu.
An additional options menu consists of a `menu-dots` icon and a dropdown menu. This is opened by clicking and the additional buttons are displayed there as entries in the dropdown list.

Buttons which contain text are expanded to the full width and have a min height of 40px. Buttons which contain icons have a width and height of 40px.
For more information see [Accessibility](/dev-guide/frontend/dev/accessibility/).

### Tables
We distinguish between tables with fix content and datatables.

Depending on the operation area you can decide between endless scroll or pagination.
An example for endless scroll can be found in the [Nextcloudfilepicker Webcomponent](https://gitlab.tugraz.at/dbp/web-components/toolkit/-/blob/master/packages/file-handling/src/nextcloud-file-picker.js).
An example for pagination can be found in [Formalize](https://gitlab.tugraz.at/dbp/formalize/formalize).

If you have an endless scroll, you can also show up a `select all` button as it was done in the Nextcloudfilepicker Webcomponent.

If you have row action buttons you can distinguish between: selecting a row and connect these rows with a button or
you can create a call to actions column in the last column of the table. Here can row action buttons placed. E.g.: Open the row in Detail,
edit a row, delete a row...

The table footer only appears if you have pagination. In these section, the pagionation, the next/prev/last/first buttons and the actual page is shown.
This footer appears sticky in the table on mobile devices.

We are using [tabulator](http://tabulator.info/) for building our tables.

#### Tables with fix content

Tables with fix contents are tables where we know the columns, where we can estimate the weight of these columns.
Because we can estimate the weight, we can collapse some columns on mobile devices and the rest of the table full can take the full width.
These columns can be collapsed or expanded on these devices.
The collapse Icon is placed in the first column of the row.

<figure id="fixedTable">
    <img src="/dev-guide/frontend/assets/ui_images/Table-fix-content.png" alt="Table with fix and selectable content" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Table with fix and selectable content</b>
    </figcaption>
</figure>

<figure id="fixedTableMobile">
    <img src="/dev-guide/frontend/assets/ui_images/table-fix-content-mobile.png" alt="Table with fix and selectable content on mobile devices" style="width:50%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Table with fix and selectable content on mobile devices</b>
    </figcaption>
</figure>

#### Datatables

Table with unknown Data or an high amount of data are datatables. We don't know the weight of each column, so we can't collapse any of them.
So we need a horizontal scroll and a short preview of a row. This is done with an "show in detail" button.
This button takes place in the last column - the action column.
The action column is frozen.

<figure id="datatable">
    <img src="/dev-guide/frontend/assets/ui_images/Datatable.png" alt="Datatable" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Datatable</b>
    </figcaption>
</figure>

<figure id="datatableMobile">
    <img src="/dev-guide/frontend/assets/ui_images/datatable-mobile.png" alt="Datatable on mobile devices" style="width:50%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Datatable on mobile devices</b>
    </figcaption>
</figure>

### Modals
We distinguish between detail Modals and Modals with tabs.

We are using a tiny lib for building these modals: [micromodal](https://micromodal.vercel.app/).

#### Detail Modal
Ein detail Modal wird verwendet um Datensätze als gesamtes anzusehen oder weitere Details zu erfahren.
The modal has a title in the left upper corner and a close sign in the right upper corner(see [detail modal](#detail-modal)).
The buttons are placed at the bottom of the modal dialogue.

An example for a detailed modal can be found in our application [Formalize](https://gitlab.tugraz.at/dbp/formalize/formalize), where 
we used the detail modal to show a whole data entry row in a compact way.

<figure id="detail-modal">
    <img src="/dev-guide/frontend/assets/ui_images/Detail_Modal.png" alt="Detail Modal" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Detail Modal</b>
    </figcaption>
</figure>

#### Modal with Tabs
If we have an additional Menu e.g. different locations for filesaving, then we can have tabs in the modal dialogue.
These tabs are placed at the left sde of the modal dialogue. On mobile devices these tabs are placed at the top of the screen.

We also have a modal title which indicates the context of this dialogue and a closing sign on the right upper corner.

An example for a modal with tabs can be found in the [filehandling webcomponent](https://gitlab.tugraz.at/dbp/web-components/toolkit/-/blob/master/packages/file-handling/src/file-source.js).

<figure id="modal-tabs">
    <img src="/dev-guide/frontend/assets/ui_images/modal_tabs.png" alt="Modal with Tabs" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Modal with Tabs</b>
    </figcaption>
</figure>