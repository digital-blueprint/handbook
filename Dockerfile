FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
  python3-poetry \
  python3-cachecontrol \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /mkdocs
COPY poetry.lock /mkdocs/
COPY pyproject.toml /mkdocs/

RUN poetry install

CMD ["poetry", "run", "mkdocs", "serve", "--dev-addr",  "0.0.0.0:8011"]
EXPOSE 8011
