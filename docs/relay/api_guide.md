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

## Pagination

By default the API collections support partial, page based pagination. This means the response it split up in pages and the response does not include a total item or page count.

The URL for the next page is included in the response under `collection["hydra:view"]["hydra:next"]`. In case there is no next page it will be omitted from the response.

**Requesting a page:** A specific page can be requested by passing a `page` query parameter.

**Requesting a page size:** The number of items per page can be changed by passing a `itemsPerPage` query parameter, but each endpoint might define page size limits internally, so the resulting page might be smaller or larger then requested. The resulting page size will be the same for the whole collection.

**Example Result:**

```
https://myapi.example.com/things?page=1
```

```json
{
  "@id": "/things",
  "@type": "hydra:Collection",
  "hydra:member": [
    {
      "@id": "/things/42",
      "@type": "https://schema.org/Thing",
      "name": "Some Thing",
    }
  ],
  "hydra:view": {
    "@id": "/things?page=1",
    "@type": "hydra:PartialCollectionView",
    "hydra:next": "/things?page=2"
  }
}
```
