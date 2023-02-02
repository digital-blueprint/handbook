# Database Management

Various of the optional bundles require a SQL database, which also means after
installation and after updates database migrations need to be performed. See the
specific bundle documentation for any other maintenance requirements.

To run outstanding migrations of any of the bundles run the following:

```
./bin/console dbp:relay:core:migrate
```
