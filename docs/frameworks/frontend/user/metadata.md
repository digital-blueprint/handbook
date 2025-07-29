# Custom Metadata / SEO

You also can change the name and description of each application to change the preview of it on some browsers or devices.(e.g. google preview and search engine, mobile preview, PWA's)

In the **index.html**:

- Adapt the `<meta property="og:site_name" content="">` with your site title in the `content` attribute.
- Adapt the `<meta property="og:url" content="" />`with your site url  in the `content` attribute.
- Adapt the `<meta title="">`, `<meta property="og:title" content="">` with your application title in the `title` and `content` attribute.
- Adapt the `<meta title="">`, `<meta property="og:title" content="">` with your application title in the `title` and `content` attribute.
- Adapt the `<meta name="description" content="">`, ` <meta property="og:description content="">` with your application title in the `title` and `content` attribute.


In the **app.manifest.json**:

- Adapt the `"name": ""` (max. of 45 characters)  with a human-readable name of your application.
  - It is the primary identifier of the app and displayed everytime the name of the application is shown and enough space is given.
- Adapt the `"short_name": ""` (max. of 12 characters recommended) with a short version of the human-readable name of your application.
  - It is a short version of the app's name and is displayed where not enough space for the full name, such as: app launcher, new tab page in chrome

For more information about the app.manifest.json you can read under [developer.mozilla.org](https://developer.mozilla.org/de/docs/Web/Manifest){:target="_blank"}.
