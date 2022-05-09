# UI Guidelines
In this guide we these topics:

- [Acticity UI Guide](#activity-ui-guide)
- [UI Flow](#ui-flow)
  - [Informational views](#informational-views)
  - [Click-through flow](#click-through-flow)
- [UI Elements](#ui-elements)
  - [Buttons](#buttons)
  - [Tables](#tables)
  - [Modals](#modals)
  

## Activity UI Guide

An Activity follows the order:

1. H2 title 
2. Subtitle with ``class="subheadline"`` - Short explanation of the acitivty
3. Intro Text - Overview of the activity if needed (Optional)
4. Activity Stuff


<figure>
    <img src="/frontend/assets/ui_images/Appshell.png" alt="Appshell Slots" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Appshell slots visualization</b>
    </figcaption>
</figure>

<figure>
    <img src="/frontend/assets/ui_images/Appshell_mobile.png" alt="Appshell Slots mobile" style="width:50%; border: 1px solid black; margin: auto;">
    <figcaption align = "center">
        <b>Appshell slots mobile visualization</b>
    </figcaption>
</figure>

## UI Flow

The user interface always follows similar rules.
We distinguish between
- Information views
- Click-through flow

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
    <img src="/frontend/assets/ui_images/Activity_UI_flow_3.png" alt="Buttongroups" style="width:100%; border: 1px solid black;">
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
    <img src="/frontend/assets/ui_images/Activity_UI_flow_3_v2.png" alt="secondary and primary buttons" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Secondary and primary buttons</b>
    </figcaption>
</figure>

#### Responsibility
In mobile views, buttons can be combined and reduced to an additional actions menu.
An additional options menu consists of a `menu-dots` icon and a dropdown menu. This is opened by clicking and the additional buttons are displayed there as entries in the dropdown list.

Buttons that contain text are expanded to the full width and have a min height of 40px. Buttons that contain icons have a width and height of 40px.
For more information see [Accessibility](#/fronten/dev/accesibility.md)

### Tables
We distinguish between

- tables with fix content
- datatables

#### Tables with fix content

#### Datatables

<figure id="datatable">
    <img src="/frontend/assets/ui_images/Datatable.png" alt="Datatable" style="width:100%; border: 1px solid black;">
    <figcaption align = "center">
        <b>Datatable</b>
    </figcaption>
</figure>


### Modals
We distinguish between

- detail Modals
- Modals with tabs

#### DetailModal
#### Modal with Tabs