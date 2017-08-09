# -- docker --
FROM node:8.2.1-alpine as docker

ENV DOCKER_VERSION 17.07.0-ce-rc2
ENV DOCKER_ARCH    x86_64
ADD "https://download.docker.com/linux/static/test/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz" /tmp/docker

# -- node.js --
FROM node:8.2.1-alpine as nodejs

RUN apk add --no-cache python py-pip \
    && pip install awscli \
    && apk --no-cache --purge -v del py-pip

COPY --from=docker /tmp/docker/docker /opt/docker

ENV PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/docker

RUN echo "Versions:" \
    && aws --version \
    && yarn --version \
    && node --version \
    && docker --version
