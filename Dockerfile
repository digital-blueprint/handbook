FROM ubuntu:24.04 AS build

RUN apt-get update && apt-get install --no-install-recommends -y \
  pipx \
  && rm -rf /var/lib/apt/lists/*

RUN pipx install uv==0.11.3
ENV PATH="/root/.local/bin:$PATH"
COPY . /app
WORKDIR /app
ENV TZ=UTC
RUN uv run zensical build

FROM nginx:stable-alpine

COPY --from=build /app/site /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Add .mjs MIME type
RUN sed -i 's/application\/javascript\s*js;/application\/javascript js mjs;/' /etc/nginx/mime.types
