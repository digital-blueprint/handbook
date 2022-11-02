# API User Guide

## Error Handling

API error responses are in JSON-LD format and look something like:

```json
{
  "@context": "/contexts/Error",
  "@type": "hydra:Error",
  "hydra:title": "An error occurred",
  "hydra:description": "My custom message"
}
```

In some cases the the bundles define/document errors with extra context:

```json
{
  "@context": "/contexts/Error",
  "@type": "hydra:Error",
  "hydra:title": "An error occurred",
  "hydra:description": "My custom message",
  "relay:errorId": "my-id",
  "relay:errorDetails": {
    "foo": 42
  }
```

* `relay:errorId` is a bundle specific error ID which is documented in the bundle documentation.
* `relay:errorDetails` can contain addition information for debugging or for creating messages that can be shown to the user. Its shape and content depends on `relay:errorId`.

## Pagination & Sorting

...
