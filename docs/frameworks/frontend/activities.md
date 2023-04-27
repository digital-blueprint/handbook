# Activities

An activity is a special web component that is self contained, can be embedded
in another page and follows some simple rules, like it registers a fixed HTML
tag for itself.

The metadata file can be used to show information about the activity without
having to load the Javascript file providing it.

## Example

```json
{
  "element": "dbp-official-signature-pdf-upload",
  "module_src": "dbp-official-signature-pdf-upload.js",
  "routing_name": "official-pdf-upload",
  "name": {
    "de": "Dokumente amtssignieren",
    "en": "Officially sign"
  },
  "short_name": {
    "de": "Dokumente amtssignieren",
    "en": "Officially sign"
  },
  "description": {
    "de": "Erlaubt das Hochladen von PDF-Dokumenten, um sie mit einer Amtssignatur zu versehen",
    "en": "Allows upload of PDF-documents to officially sign them"
  }
}
```

* `element`: The HTML tag name that this activity is registered under
* `module_src`: The javascript file to load for `element` to be available
* `routing_name`: An URL-safe value used for routing. Should be unique.
* `name`: The name of the activity.
* `short_name`: The short name of a activity, used in places where limited space is a concern.
* `description`: Description of the activity.