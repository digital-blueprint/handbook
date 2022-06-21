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
The app icon appears at two places in the dbp-branded versions of the apps: in the app shell header and as a PWA icon.

<figure id="fig1" style="width:100%;">
    <img src="../assets/appicon_example_clean.svg" alt="App icon example" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption>
        <b>Fig. 1: App icon example</b>
    </figcaption>
</figure>

<figure id="fig2" style="width:100%;">
    <img src="../assets/appicon_example.svg" alt="App pwa example" style="max-width:200px; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption>
        <b>Fig. 2: App pwa example</b>
    </figcaption>
</figure>


<figure id="fig3" style="width:100%;">
    <img src="../assets/appheader_example.svg" alt="App header example" style="max-width:100%; box-shadow: 1px 1px 3px grey; background-color:white; margin:auto;">
    <figcaption>
        <b>Fig. 3: App header example</b>
    </figcaption>
</figure>


### App shell header
The icon in the app shell header[[fig3]](#fig3) is the plain icon with no squares and in true black and 50% opacity. [[fig1]](#fig1)
For more information about the appearance and how to create an app icon, see [app icon](../icons/#app-icon) under icons.

### PWA Icon
The icon in the color white and on the squares is used as the pwa icon[[fig2]](#fig2).
For further information and placement take a look at [app icon](../icons/#app-icon).

## Favicons of apps
There exists many favicons in different sizes and formats for different devices and uses.

We need following files: 

| Filename | Size | Use Case | With app icon | 
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
| maskable-icon-640x640.png | 640x640 px | For newer android devices | ✓ |

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
browserconfig.xml for windows and Windows phones
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

We use the favicon generator with MIT license [realfaviongenerator](https://realfavicongenerator.net/){:target="_blank"} to generate the favicons and app icons.
After that we have to create the maskable icons. For that we use the [maskable.app](https://maskable.app/){:target="_blank"}.

#### Realfavicon generator
How to use the [realfaviongenerator](https://realfavicongenerator.net/){:target="_blank"}:

1. Upload the initial favicon file *favicon.svg*. You can find this in the gitlab repository [dbp-ci](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/){:target="_blank"}.
2. **Favicon for iOS** Section: 
    1. Add a `dedicated picture`, the app icon. 
    2. Select the option "Add a solid, plain background to fill the transparent regions."
    3. Background-color: `#ffffff`
    4. Margin-size: 4px
3. **Favicon for Android Chrome** Section:
    1. Add a `dedicated picture`, the app icon.
    2. Select the option "No change, keep the master picture as it is."
    3. App name: "dbp *shortname-of-the-app*"
    4. Theme color: `#ffffff`
4. **Windows Metro** Section:
    1. Add a `dedicated picture`, the app icon.
    2. Use this color ... : `#ffffff`
5. **macOS Safari** Section:
    1. Add the favicon file *safari-pinned-tab.svg*. You can find this in the gitlab repository [dbp-ci](https://gitlab.tugraz.at/dbp/dbp-ci/-/tree/main/){:target="_blank"}.
    2. Theme color: `#3775c1`
6. Generate the icons and delete icons which we don't need
7. Place them in the `assets/favicons/` directory

#### Maskable.app
How to use the [maskable.app](https://maskable.app/){:target="_blank"}:

1. Click "Editor"
2. Upload the app icon(png) in the "layers section" on the right
3. Add `20%` padding to the icon
4. Select a white background on the left
5. Click export
    1. Select `Max size (640x640)` and `512x512`
6. Download them and name them correctly (*maskable-icon-512x512.png* and *maskable-icon-640x640.png)
7. Place them in the `assets/favicons/` directory

### Add the favicons to your project
1. Add all previous generated and [needed](#favicons-of-apps) files in the `assets/favicons/` directory. 
2. Add in rollup in the copy section:

```js
{src: 'assets/favicons/*.png', dest: 'dist/' + (await getDistPath(pkg.name))},
{src: 'assets/favicons/*.svg', dest: 'dist/' + (await getDistPath(pkg.name))},
{src: 'assets/favicons/*.ico', dest: 'dist/' + (await getDistPath(pkg.name))},
{src: 'assets/favicons/site.webmanifest', dest: 'dist', rename: pkg.name + '.webmanifest'},
{src: 'assets/favicons/browserconfig.xml', dest: 'dist', rename: pkg.name + '_browserconfig.xml'}
```
3. Add in html.ejs

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


## Applying own colors
For not dbp uses, you might want to use the app icon and favicons from dbp, but with your brand colors.
This and other changes can be read in the [Theming documentation](../../frontend/theming/#use-the-dbp-app-icon-with-your-brand-colors).
