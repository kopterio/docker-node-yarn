FROM node:7.9

ARG DEBIAN_FRONTEND=noninteractive

# install Facebook Yarn
RUN apt-get update -yq \
    && apt-get install -yq apt-transport-https curl ca-certificates gnupg2 software-properties-common \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
    && apt-get update -yq && apt-get install -yq yarn \
    && rm -rf /var/lib/apt/lists/*

# install Docker (in docker)
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update -yq && apt-get install -yq docker-ce \
    && rm -rf /var/lib/apt/lists/*
