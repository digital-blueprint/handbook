# Core Bundle

The [Core Bundle](https://gitlab.tugraz.at/dbp/relay/dbp-relay-core-bundle) is the central bundle
that needs to be installed in every API gateway and also is a dependency of every other API bundle.

## Configuration

Read more about the bundle configuration at [Configure the Core Bundle](https://dbp-demo.tugraz.at/handbook/relay/admin/config/#core-bundle-configuration).

### Check-in

Check-in needs queued-tasks and locks. There are multiple backends to choose from (MySQL, Redis, ...)
on how to persist data.

Read more about the configuration at [Queued Tasks Configuration](https://dbp-demo.tugraz.at/handbook/relay/admin/queue/)
and [Locks Configuration](https://dbp-demo.tugraz.at/handbook/relay/admin/locks/).
