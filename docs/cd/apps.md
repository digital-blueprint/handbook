# Apps
The branding for a specific app consists of three parts: the name, the friendly name and an app icon.

## App name
The app name is a creative almost unique title. It should be recognizable and simple.
E.g.: mono, esign, formalize, greenlight, check-in... It also should not exceed a maxlength of 15 characters and should have a minimum of 4 characters.

## App friendly name
Because the app name can be creative and brandend we need an explanation of it. The friendly name of an app is a description of the app name. 
E.g.: mono - digital payment service, esign - electronic signature service, formalize - electronic forms. greenlight - a ticket system, check-in - a contact tracing system...
It also should not exceed a maxlength of 30 characters and should have a minimum of 10 characters.

## App icon
Das app icon erscheint an zwei Orten in der dbp-branded versionen der apps: im appshell header und als pwa icon.

### Appshell header
Das icon im appshell header[fig3](#fig3) ist das einfache icon ohne quadrate in True black und 50% opacity. [fig1](#fig1)
Für mehr informationen über das aussehehn siehe [appicon](/icons/#appicons) unter icons. 

### PWA Icon
Als pwa icon icon wird genau dieses icon in weiß auf den quadraten verwendet[fig2](#fig2).
An app icon consists of two parts: the icon itself and the dbp squares behind them.

The icon has to be placed infront of the first square


Wo erscheint das appicon. (header, appicon, favicon?)

wie soll ein app icon aussehen:
Platzierung vom icon in den squares
color, icon styles, einfach
wie & wo muss mans speichern

<figure id="fig1" style="width:100%;">
    <img src="../assets/appicon_example.svg" alt="App icon example" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 2: App icon example</b>
    </figcaption>
</figure>

<figure id="fig2" style="width:100%;">
    <img src="../assets/appicon_exmaple.svg" alt="App pwa example" style="max-width:100%; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 1: App pwa example</b>
    </figcaption>
</figure>


<figure id="fig3" style="width:100%;">
    <img src="../assets/appheader_example.svg" alt="App header example" style="max-width:100%; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption align = "center">
        <b>Fig. 1: App header example</b>
    </figcaption>
</figure>

### Usage as pwa
mal gucken was da hinkommt

## Applying own colors
gradient on squares
file-> adapt squares specific app file
adapt the gradient
save




##### How to adjust the icons
Make sure you have installed the [fonts](../fonts/) on your working device.
Open the initial file *dbp_logo_on_white.pdf* in Inkscape. Place the previously created icon in the middle on the rightmost top square.
The color of the icon depends on the background of the logo file.
If the file is for black background then the icon should have the color `#222120` and if the file is for white background the app icon should have the color `#ffffff`.
Save it named *dbp_yourapplication_logo_on_white* as pdf, svg, eps in an own folder called `youraplication` in the logo folder.

Repeat this process with the all other pages and export them to the appropriate files.


## Favicons of apps
There exists many favicons in different sizes and formats for different devices and uses.
use https://realfavicongenerator.net/ to generate appicons
use: https://maskable.app/ to generate maskable icons
and


Wir brauchen:
| Filename | Size | Usecase | With appicon | 
| -------- | ---- | ------- | ------------ |
| favicon.ico | | Default, IE | |
| favicon.svg | | For all modern browsers | |
| favicon-16x16.png | 16x16 px | Classic favicon displayed in the tabs | |
| favicon-32x32.png | 32x32 px | For safari on Mac OS | |
| android-chrome-192x192.png | 192x192 px | For Android Chrome M39+ with 4.0 screen density | ✓ |
| android-chrome-512x512.png | 512x512 px | For Android Chrome M47+ Splash screen with 4.0 screen density | ✓ |
| mstile-144x144.png | 144x144 px | For Windows 8 / IE10 | ✓ |
| mstile-150x150.png | 150x150 px | For Windows phone | ✓ |
| apple-touch-icon.png | 152x152 px | For Apple iPhones | ✓ |
| safari-pinned-tab.svg |  | For safari tabs | ✓ |
| maskable-icon-512x512.png | 512x512 px | For newer android devices | ✓ |
| maskable-icon-144x144.png | 144x144 px | For newer android devices | ✓ |

Other files:

site.webmanifest for android phones
```json
{
    "name": "dbp playground",
    "short_name": "dbp playground",
    "icons": [
        {
            "src": "local/dbp-activity-showcase/android-chrome-192x192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "local/dbp-activity-showcase/android-chrome-512x512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "any"
        },
        {
            "src": "local/dbp-activity-showcase/maskable-icon-512x512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "maskable"
        },
        {
            "src": "local/dbp-activity-showcase/maskable-icon.png",
            "sizes": "640x640",
            "type": "image/png",
            "purpose": "maskable"
        }

    ],
    "theme_color": "#ffffff",
    "background_color": "#ffffff",
    "start_url": "./",
    "display": "standalone"
}
```
browserconfig.xml for windows and windowsphones
```xml
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
    <msapplication>
        <tile>
            <square150x150logo src="local/dbp-activity-showcase/mstile-150x150.png"/>
            <TileColor>#ffffff</TileColor>
        </tile>
    </msapplication>
</browserconfig>
```

in rollup:

```js
{src: 'assets/favicons/*.png', dest: 'dist/' + (await getDistPath(pkg.name))},
{src: 'assets/favicons/*.svg', dest: 'dist/' + (await getDistPath(pkg.name))},
{src: 'assets/favicons/*.ico', dest: 'dist/' + (await getDistPath(pkg.name))},
{src: 'assets/favicons/site.webmanifest', dest: 'dist', rename: pkg.name + '.webmanifest'},
{src: 'assets/favicons/browserconfig.xml', dest: 'dist', rename: pkg.name + '_browserconfig.xml'}
```

in html.ejs

```html
    <!-- Favicons -->
    <link rel="icon" type="image/svg+xml" href="<%= getPrivateUrl('favicon.svg') %>">
    <link rel="apple-touch-icon" sizes="180x180" href="<%= getPrivateUrl('apple-touch-icon.png') %>">
    <link rel="icon" type="image/png" sizes="32x32" href="<%= getPrivateUrl('favicon-32x32.png') %>">
    <link rel="icon" type="image/png" sizes="16x16" href="<%= getPrivateUrl('favicon-16x16.png') %>">
    <link rel="manifest" href="<%= getUrl(name + '.webmanifest') %>">
    <link rel="mask-icon" href="<%= getPrivateUrl('safari-pinned-tab.svg') %>" color="#3775c1">
    <meta name="msapplication-config" content="<%= getUrl(name + '_browserconfig.xml') %>" />
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="theme-color" content="#ffffff">
    <meta name="apple-mobile-web-app-status-bar-style" content="white">
```