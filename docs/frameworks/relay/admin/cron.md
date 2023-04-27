# Cron Jobs

The API gateway provides a single command that needs to be run every few minutes and which will execute internally registered cron jobs depending on their schedule:

```
./bin/console dbp:relay:core:cron
```

To force running all cron jobs independent of their schedule you can pass the `--force` option to `dbp:relay:core:cron`. Note that this  might trigger externally visible actions, such as email reports being sent etc. depending on what the installed bundles use cron jobs for.

To see a list of all internally registered cron jobs and their metadata, run the following:

```console
./bin/console dbp:relay:core:cron:list
```
