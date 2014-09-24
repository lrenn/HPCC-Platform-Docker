HPCC-Platform-Docker
====================

HPCC running in Docker

...a really simple Docker container for playing around with HPCC. Based on the excellent Docker-noobie friendly [phusion/baseimage](https://github.com/phusion/baseimage-docker).

The container doesn't have a database server configured. It should be fairly easy to add one, or spin up a new container dedicated to running a data store.

**Note:** Do not use this for anything resembling a production environment.

## Usage

First, verify it works:

    # docker build -t hpcc .
    # docker run -t -p 80 hpcc

This will expose port 80 within the container, you should run `docker ps` to check the port equivalent on the host machine and go to http://localhost:{EXPOSED_PORT} to confirm you get the proverbial "Hello, world!" message.
