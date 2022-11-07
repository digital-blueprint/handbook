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

The default page size and page size limits can vary between different endpoints.

**Requesting a page:** A specific page can be requested by passing a `page` query parameter.

**Requesting a page size:** The number of items per page can be changed by passing a `itemsPerPage` query parameter, but each endpoint might define page size limits internally, so the resulting page might be smaller or larger then requested. The resulting page size will be the same for the whole collection as long as all other parameters are the same.

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


## Translations

API responses generally contain content in one language/translation. The API user can request a language by passing an [Accept-Language](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language) header.

In special cases where the frontend can't really pass HTTP headers to the API, like when a HTML response should be displayed in an iframe, then the endpoint also takes a `lang` query parameter with the same syntax as the `Accept-Language` header.

For error messages it is recommended to use error IDs instead of text messages, so the API user can provide their own messages and translations.
