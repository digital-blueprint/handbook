# API Guidelines

A random list of things we try to keep consistent.

## Filtering based on resource IDs

* Parameter name:
    * Keep it consistent with the attribute of the result.
    * Describe the entity that needs to be passed in the API docs description.
* Value:
    * Just pass the identifier part, not the whole path or URL.

Example:

`https://example.api/bundle/things?member=1234`
