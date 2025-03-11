# Setting up Docker & Docker-Compose

We use docker and docker-compose extensively for development, so it's
recommended to set it up in all cases.

How to set up docker/docker-compose on Ubuntu/Debian:

- Install docker: `sudo apt install docker.io`
- Install docker-compose: `sudo apt install docker-compose-v2`
- Add your user to the `docker` group so you don't have to use `sudo`
  for invoking docker: `sudo usermod -aG docker $USER`. `$USER` will
  automatically be replaced with your username and this will only take
  effect until the next login/restart.

Helpful resources:

- Introduction to docker-compose:
  <https://docs.docker.com/compose/gettingstarted>
