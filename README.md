# digital blueprint - Handbook

[Website](https://handbook.digital-blueprint.org/)

This handbook contains the documentation for the digital blueprint project.

## Build and run this Documentation

Clone the submodules:

- `git submodule init`
- `git submodule update`

Using uv:

- `uv run zensical serve --dev-addr 127.0.0.1:8011`
- <http://127.0.0.1:8011>

Using Docker Compose:

- `cd docker-dev`
- `docker compose up --build`
- <http://127.0.0.1:8011>

Keep `--build` when starting after pulling updates. Compose mounts the current
checkout into the container, and an older image may have a `uv` version that
cannot read the updated `pyproject.toml` or `uv.lock`.

## Update the submodules

- `git submodule foreach git checkout main`
- `git submodule foreach git pull`
- Sync "nav" in mkdocs.yml

## Add modules to the documentation

- `git submodule add <git-link>`
- Create symlink to the `/docs` directory of the new submodule using a relative path (`ln -s ../<link-to-your-new-bundle> bundle-name`)
- Add a section with your new `.md` files in `mkdocs.yml`
