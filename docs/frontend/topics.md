# Topics

A topic is a collection of activities which are in some way related (e.g. all
activities that provide functionality for the library system). A topic can have
a name, a description, a routing ID, and it defines a set of attributes which
can be synced between the contained activities and saved/restored between runs.

## Example

```json
{
  "name": {
    "de": "Elektronisches Signaturservice",
    "en": "Electronic Signatures"
  },
  "short_name": {
    "de": "Signaturservice",
    "en": "Signature Service"
  },
  "description": {
    "de": "Mit dieser Applikation können Sie PDF-Dokumente signieren",
    "en": "With this application you can sign PDF documents"
  },
  "routing_name": "signature",
  "activities": [
    {"path": "dbp-official-signature-pdf-upload.metadata.json",
     "visible": true},
    {"path": "dbp-qualified-signature-pdf-upload.metadata.json"},
    {"path": "dbp-signature-verification.metadata.json",
     "visible": true},
    {"path": "dbp-signature-verification-full.metadata.json",
     "visible": true}
  ],
  "attributes": []
}
```

* `name`: The long name of the topic
* `short_name`: The short name of a topic, used in places where limited space is a concern.
* `description`: Description of the topic.
* `routing_name`: A URL-safe identifier that can be used for routing. Should be unique.
* `activities`: A list of activities.
  * `path`: Path to an activity metadata file relative to the location of this file.
  * `visible`: Wether the activity should be visible.
    (to hide unfinished activities for production for example)
* `attributes`: A set of attributes that all activities in this topic can share.
  This means when switching activities these attributes can be forwarded to the next
  activity, or in case the page is related these attributes can be restored.