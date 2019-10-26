ARG _TAG=latest
FROM microsoft/azure-cli:${_TAG}
# https://hub.docker.com/r/microsoft/azure-cli

MAINTAINER iganari

# OS Prepare
# setting timezone
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*
