FROM mcr.microsoft.com/azure-cli
# https://hub.docker.com/_/microsoft-azure-cli

MAINTAINER iganari
LABEL maintainer="iganari"

### setting timezone
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

ARG tf_ver=0.12.18
RUN curl https://releases.hashicorp.com/terraform/${tf_ver}/terraform_${tf_ver}_linux_amd64.zip -o /usr/local/bin/terraform_${tf_ver}_linux_amd64.zip && \
    cd /usr/local/bin/ && \
    unzip terraform_${tf_ver}_linux_amd64.zip && \
    rm -f /usr/local/bin/terraform_${tf_ver}_linux_amd64.zip

# https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-binary-with-curl-on-linux

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl &&\
    chmod +x ./kubectl &&\
    mv ./kubectl /usr/local/bin/kubectl












ENV KUBE_LATEST_VERSION="v1.15.1"
RUN apk add --update ca-certificates && \
    apk add --update -t deps curl && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    apk del --purge deps && \
    rm /var/cache/apk/*
