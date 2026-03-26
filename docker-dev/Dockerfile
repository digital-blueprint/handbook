FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
  pipx \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /docs
RUN pipx install uv==0.9.5
ENV PATH "/root/.local/bin:$PATH"
COPY uv.lock /docs/
COPY pyproject.toml /docs/

RUN uv sync
ENV TZ=UTC

CMD ["uv", "run", "zensical", "serve", "--dev-addr",  "0.0.0.0:8011"]
EXPOSE 8011
