FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
  pipx \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /mkdocs
RUN pipx install poetry==2.1.1
ENV PATH "/root/.local/bin:$PATH"
COPY poetry.lock /mkdocs/
COPY pyproject.toml /mkdocs/

RUN poetry install
ENV TZ=UTC

CMD ["poetry", "run", "mkdocs", "serve", "--dev-addr",  "0.0.0.0:8011"]
EXPOSE 8011
