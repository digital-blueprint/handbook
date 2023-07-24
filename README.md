# digital blueprint - Handbook

[Website](https://handbook.digital-blueprint.org/)

This handbook contains the documentation for the digital blueprint project.

## Build and run this Documentation
Clone the submodules:

* `git submodule init`
* `git submodule update`

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

## Add modules to the documentation
* `git submodule add <git-link>`
* Create symlink to the `/docs` directory of the new submodule using  a relative path (`ln -s ../<link-to-your-new-bundle> bundle-name`)
* Add a section with your new `.md` files in `mkdocs.yml` 
