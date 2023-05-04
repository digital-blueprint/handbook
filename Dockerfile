FROM ubuntu:22.04 as build

RUN apt-get update && apt-get install --no-install-recommends -y \
  pipx \
  && rm -rf /var/lib/apt/lists/*

RUN pipx install poetry==1.4.2
ENV PATH "/root/.local/bin:$PATH"
COPY . /app
WORKDIR /app
RUN poetry install --only main
RUN poetry run mkdocs build

FROM nginx:stable-alpine

COPY --from=build /app/site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
