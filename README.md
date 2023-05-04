# digital blueprint - Handbook

[Website](https://handbook.digital-blueprint.org/)

This documentation is targeted at people who want to contribute to the DBP
project. It explains various things regarding the infrastructure, development
environments, development guidelines and other helpful tips and tricks.

If some information doesn't fit into project specific documentation, or would be
repeated in all projects, then this is a good place to include it.

## Build and run this Documentation

Using poetry:

* `poetry install`
* `poetry run mkdocs serve --dev-addr 127.0.0.1:8011`
* <http:/127.0.0.1:8011>

Using docker-compose:

* `cd docker-dev`
* `docker-compose up`
* <http:/127.0.0.1:8011>

## Update the submodules

* `git submodule foreach git checkout main`
* `git submodule foreach git pull`
* Sync "nav" in mkdocs.yml
