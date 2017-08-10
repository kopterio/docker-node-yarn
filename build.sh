#!/bin/sh

export DOCKER_VERSION=17.07.0-ce-rc2
export DOCKER_ARCH=x86_64

tar tzf docker.tgz >/dev/null || \
  curl "https://download.docker.com/linux/static/test/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz" -o docker.tgz

docker build -t kopterio/node-docker-aws:8.2.1-alpine .
