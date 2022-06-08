# Icons
## Icon style
Our icons have to follow these rules:

- **Canvas size:** 8.467 mm x 8.467 mm
- **Max size:** 7.5 mm x 7.5 mm
- **Stroke size:** 1.5 pt
- **Rounding for edges:** 0.212 mm
- **Edges:** rounded
- **Ends of lines:** rounded 
- **Color:** monochromatic black (except [appicons](#appicon))
- **Surface:** Generally not filled, expect the surface gets too small, then it should be filled


<figure id="fig1" style="width:100%;">
    <img src="../assets/source_pacman.svg" alt="Icon example" style="width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 1: Icon example</b>
    </figcaption>
</figure>

## Icon libs
We are using the open source icon set [iconoir](https://iconoir.com/){:target="_blank"}.

## Creating an icon
If you don't find a suitable icon in the lib, you have to make a new one or adapt an existing one.

### Create a new icon

1. Download an existing icon and open it with inkscape
2. Delete it and draw your own icon with the correct [icon styles](#icon-style)
3. save as svg with a `dbp-` prefix and a meaningful name

### Adapt an existing icon

1. Download an existing icon and open it with inkscape
2. Make your changes
3. Save as svg with a `dbp-` prefix and a meaningful name

    
## Appicon

If you create a new app icon you have to follow the above [rules](#icon-style).

App icons has additional these rules:

- **Highlight Color:** black with 50% opacity[[Fig. 2]](#fig2)
- **Stroke size:** 1 pt

For further information see [Appicon](../apps).

<figure id="fig2" style="width:100%;">
    <img src="../assets/appicon_example.svg" alt="App icon example" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 2: App icon example</b>
    </figcaption>
</figure>

##### How to adjust the icons
Make sure you have installed the [fonts](../fonts/) on your working device.
Open the initial file *dbp_logo_on_white.pdf* in Inkscape. Place the previously created icon in the middle on the rightmost top square.
The color of the icon depends on the background of the logo file.
If the file is for black background then the icon should have the color `#222120` and if the file is for white background the app icon should have the color `#ffffff`.
Save it named *dbp_yourapplication_logo_on_white* as pdf, svg, eps in an own folder called `youraplication` in the logo folder.

Repeat this process with the all other pages and export them to the appropriate files.
