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

If you create a new app icon[[Fig. 2]](#fig2)[[Fig. 3]](#fig3) you have to follow the above [rules](#icon-style).

App icons has additional these rules:

- **Highlight Color:** black with 50% opacity
- **Stroke size:** 1 pt

For further information see [Appicon](../apps).

<figure id="fig2" style="width:100%;">
    <img src="../assets/appicon_example_clean.svg" alt="App icon example" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 2: App icon example</b>
    </figcaption>
</figure>

<figure id="fig3" style="width:100%;">
    <img src="../assets/appicon_example.svg" alt="App icon example with dbp background" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 3: App icon example as pwa</b>
    </figcaption>
</figure>


### Creating an app icon
To create an app take a look at [Creating an icon](#creating-an-icon) in the section above.
And apply a stroke size with **1pt** and a part with 50% opactity.

You need to create the following files: (replace `appname` with the shortname of your application)

- `appname_appicon_dbp.svg`: The app icon with the digital blueprint squares as background*
- `appname_appicon.svg`: The app icon in `#222120`
- `appname_appicon_dbp.png`: The app icon with the digital blueprint squares as background, 600x600px and 72 ppi
- `appname_appicon.png`: The app icon in `#222120`, 600x600px and 72 ppi

\* The icon should be placed in front of the `dbp_logo_squares_on_white.svg`. 
The icon should be in the middle of the first square. The maximum size can be taken from [fig4](#fig4).

<figure id="fig4" style="width:100%;">
    <img src="../assets/appicon_example_placement.svg" alt="App icon example with dbp background correct placement" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 4: App icon example as pwa with correct placement</b>
    </figcaption>
</figure>
