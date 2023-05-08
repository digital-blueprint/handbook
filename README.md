# digital blueprint - Handbook

[Website](https://handbook.digital-blueprint.org/)

This handbook contains the documentation for the digital blueprint project.

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
