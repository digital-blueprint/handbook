# Pagination

* Collections should use the `PartialPaginatorInterface` by default.
* The `page` query parameter should be respected.
* The `itemsPerPage` query parameter should be considered. The implementation can limit the page size so it doesn't match `itemsPerPage` if wanted.
* The default page can be different for each endpoint.
* The page size should be constant for a collection with the same parameters (ignoring `page`).
