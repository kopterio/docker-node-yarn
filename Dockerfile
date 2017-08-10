FROM node:8.2.1-alpine as nodejs

RUN apk add --no-cache python py-pip \
    && pip install awscli \
    && apk --no-cache --purge -v del py-pip

# ADD "https://download.docker.com/linux/static/test/${DOCKER_ARCH}/docker-${DOCKER_VERSION}.tgz" /opt
# provided by build.sh
ADD docker.tgz /opt

ENV PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/docker

RUN echo "Versions:" \
    && echo "AWS CLI Version:" && aws --version \
    && echo "Yarn Version:" && yarn --version \
    && echo "Node Version:" && node --version \
    && echo "Docker Version:" && docker --version
