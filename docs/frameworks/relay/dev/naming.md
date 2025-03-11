# Naming Conventions

The API framework is split into multiple modules/packages/bundles which contains
things that need to be named, like bundle names, package names, namespaces etc.
To keep the naming of all these parts consistent we have worked out a set of
naming rules. If you extend the API framework with your own bundle/package it's
recommended to follow these rules if possible.

## Prerequisites

These four names are the source for everything else and need to be decided on
first. Ideally they are short, unique enough, and self describing :)


**Vendor**

The organization that created the package, one or more words.

Example: `dbp`, `uni-graz`, `mffs`

In our case this is always `dbp`

**Category**

The name of the project managed by `vendor`, one or more words.

In our case this is always `relay`

**UniqueName**

The name of the bundle, one or more words. Needs to be unique, so care has to
be taken to avoid conflicts with other developers creating similar bundles.

Example: `check-in`

In case of of a connector bundle the unique name follows the following format:
`<feature-bundle>-connector-<external-system-name>`, for example
`greenlight-connector-campusonline`. All other rules apply the same as with
every other unique name.

**FriendlyName**

A friendly version of UniqueName meant for displaying to the user or for
grouping and not in an API, can contain spaces and can be a bit longer.

Example: `Location Check In`

### Letter Casing Variants

* Source: `check in`, `API request`
* PascalCase: `CheckIn`, `ApiRequest` (Note that `API` -> `Api`)
* KebapCase: `check-in`, `api-request`
* SnakeCase: `check_in`, `api_request`

## Bundle Naming

### Composer Package Names

* Schema: `<Vendor, KebapCase>/<Category, KebapCase>-<UniqueName, KebapCase>-bundle`
* Example: `dbp/relay-check-in-bundle`
* Usage: In the `composer.json` file. Also specifies the target directory when
  installing the package.

### PHP Namespaces

* Schema: `<Vendor, PascalCase>\<Category, PascalCase>\<UniqueName, PascalCase>Bundle`
* Example: `Dbp\Relay\CheckInBundle`
* Usage: In all included PHP files. Adds namespacing to all classes.

### Symfony Bundle Names

* Schema: `<Vendor, PascalCase><Category, PascalCase><UniqueName, PascalCase>Bundle`
* Example: `DbpRelayCheckInBundle`
* Resulting configuration key: `dbp_relay_check_in`
* Usage: Identifies the bundle in Symfony. Gets used as the source for the
  configuration key by converting it to SnakeCase after stripping the `Bundle`
  suffix by Symfony.

## API-Platform Resource Naming

### Entity Names / PHP Class Names

* Schema: `<*, PascalCase>`
* Examples: `Person`, `Book`, `Room`, `CheckInAction`
* Usage: As the PHP class name. As the PHP file name containing the class
  (`Book.php`). As source for the short name, referenced as `EntityName`.

### API-Platform Short Names

* Schema: `<UniqueName, PascalCase><EntityName, PascalCase>`
* Example: `CheckInPerson` (UniqueName=CheckIn, EntityName=Person)
* Usage: As section headers in the API docs and user for sorting there. Used as
  key for looking up API resource paths in the frontend.

Base Bundle Exception: In case `UniqueName` starts with `Base` then `UniqueName` =
`Base` in this case.

### Resource Paths

* Schema: `/<UniqueName, KebapCase>/<EntityName, KebapCase, Pluralized>`
* Example: `/check-in/rooms` (UniqueName=CheckIn, EntityName=Room)
* Usage: Path prefix for all resource operations

Base Bundle Exception: In case `UniqueName` starts with `Base` then `UniqueName` =
`Base` in this case.

### Schema.org IRIs

* Schema: See schema.org
* Usage: Contained in the JSON-LD responses.

### Serialization Groups

See https://api-platform.com/docs/core/serialization/#using-serialization-groups

* Schema: `<UniqueName, PascalCase><EntityName, PascalCase>:<SerializationKey, KebapCase>`
* Example: `CheckInPerson:output`
* Usage: in `normalization_context` and `denormalization_context`

The extra namespacing is needed since Entities can be embedded and we want to avoid inheriting serialization groups from the embedding entities.

Base Bundle Exception: In case `UniqueName` starts with `Base` then `UniqueName` =
`Base` in this case.

### Open API Tags

* Schema: `<FriendlyName>`
* Example: `Location Check In`
* Usage: for grouping the endpoints in the API documentation

## GIT Repository Naming

In case the vendor is in some form already included the URL path (github.com/vendor/relay-check-in-bundle) then:

* Schema: `<Category, KebapCase>-<UniqueName, KebapCase>-bundle`
* Naming: `relay-check-in-bundle`

otherwise:

* Schema: `<Vendor, KebapCase>-<Category, KebapCase>-<UniqueName, KebapCase>-bundle`
* Naming: `dbp-relay-check-in-bundle`

## Database Table Prefix

In case multiple bundles want to use the same DB we want to avoid any conflicts.

* Schema: `<UniqueName, SnakeCase>_<*, SnakeCase>`
* Naming: `check_in_things`, `greenlight_permits`, `formalize_submissions`

Note, we share the namespace with Symonfy, which already defines things like `lock_keys`, `messenger_messages` and `doctrine_migration_versions`.

## Error Codes Prefix

This is used in `ApiError::withDetails()`, for example: `ApiError::withDetails(Response::HTTP_NOT_FOUND, 'Not Found', 'greenlight:permit-not-found')`

* Schema: `<UniqueName, KebapCase>:<*, KebapCase>`
* Naming: `greenlight:permit-not-found`, `check-in:some-special-error`

## Symfony Command Naming

* Schema:
    * `<Vendor, KebapCase>:<Category, KebapCase>:<UniqueName, KebapCase>:<Command, KebapCase>`
    * `<Vendor, KebapCase>:<Category, KebapCase>:<UniqueName, KebapCase>:<CommandTopic, KebapCase>:<Command, KebapCase>`
* Example:
    * `dbp:relay:core:test`
    * `dbp:relay:core:queue:work`
* Usage: Shown when running ./bin/console`

## Symfony Service Tags Naming

* Schema:
    * `<Vendor, SnakeCase>.<Category, SnakeCase>.<BundleName, SnakeCase>.<ServiceTagName, SnakeCase>`

`ServiceTagName` is freely selectable

* Example:
    * Service tag name: `dbp.relay.core.cron_job`, `dbp.relay.core.health_check`

* Usage: when tagging Symfony services

## Monolog Channel Names

* Schema:
    * `<Vendor, SnakeCase>_<Category, SnakeCase>_<BundleName, SnakeCase>_<ChannelName, SnakeCase>`

`ChannelName` is freely selectable, e.g. `audit`

* Example: `dbp_relay_mono_audit`

* Usage: when creating new monolog logging channels in Symfony

## Symfony Translation Domains

* Schema:
    * `<Vendor, SnakeCase>_<Category, SnakeCase>_<BundleName, SnakeCase>`

* Example: `dbp_relay_mono`

* Usage: when providing translations in Symfony, or for allowing the user to
  provide translations. (see https://symfony.com/doc/current/translation.html)

## Open Questions

* We use `API` -> `Api` for PascalCase because Symfony derives the config key
  from it, and we want it to be `api_` and not `a_p_i_`. We could define an
  alternative PascalCase where `API` -> `API` for everything except the bundle
  name.

## Generate DBP Symfony bundle

If you want to create a DBP Symfony bundle in the root directory of the server you can call:

```bash
./bin/console dbp:relay:maker:make:bundle --unique-name=greenlight --friendly-name="Electronic Covid Access Permits" --example-entity=Permit
```

If you also want to set the "vendor" and "category" you can use two more parameters:

```bash
./bin/console dbp:relay:maker:make:bundle --vendor=myvendor --category=mycategory --unique-name=greenlight --friendly-name="Electronic Covid Access Permits" --example-entity=Permit
```
