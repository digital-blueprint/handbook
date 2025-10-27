FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
  pipx \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /mkdocs
RUN pipx install uv==0.9.5
ENV PATH "/root/.local/bin:$PATH"
COPY uv.lock /mkdocs/
COPY pyproject.toml /mkdocs/

RUN uv sync
ENV TZ=UTC

CMD ["uv", "run", "mkdocs", "serve", "--dev-addr",  "0.0.0.0:8011"]
EXPOSE 8011
