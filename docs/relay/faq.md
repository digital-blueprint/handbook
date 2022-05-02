# FAQ

## In some cases composer install fails while clearing the cache

After certain updates or when files move around Symonfy gets confused and
clearing the cache fails due to an invalid cache, for example with something
like:

`Script cache:clear returned with error code 255`

You can work around this issue by deleting the `var/cache` directory manually
and then calling `composer install` again.
