# Translations

API responses generally contain content in one language/translation. The API user can request a language by passing an [Accept-Language](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept-Language) header.

In special cases where the frontend can't really pass HTTP headers to the API, like when a HTML response should be displayed in an iframe, then the endpoint may also take a `lang` query parameter with the same syntax as the `Accept-Language` header. See the respective documentation if this is possible.

In case the API returns an error it is recommended to use the contained `relay:errorId` and map it to a custom error message (+ translation) provided by the frontend, instead of displaying the contained error message as is.