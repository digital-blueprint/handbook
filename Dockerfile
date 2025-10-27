FROM ubuntu:24.04 AS build

RUN apt-get update && apt-get install --no-install-recommends -y \
  pipx \
  && rm -rf /var/lib/apt/lists/*

RUN pipx install uv==0.9.5
ENV PATH="/root/.local/bin:$PATH"
COPY . /app
WORKDIR /app
ENV TZ=UTC
RUN uv run mkdocs build

FROM nginx:stable-alpine

COPY --from=build /app/site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
