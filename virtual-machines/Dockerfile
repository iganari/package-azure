ARG _TAG=2.3.1
FROM mcr.microsoft.com/azure-cli:${_TAG}
# https://hub.docker.com/_/microsoft-azure-cli
# Tag List --> https://mcr.microsoft.com/v2/azure-cli/tags/list

MAINTAINER iganari

# setting timezone
RUN apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

# install git
RUN apk --update add vim git \
    && rm -rfv /var/lib/apt/lists/* \
    && rm -rfv /var/cache/apk/*

# install Terraform
ARG _terraform_version='0.12.24'
RUN curl https://releases.hashicorp.com/terraform/${_terraform_version}/terraform_${_terraform_version}_linux_amd64.zip -o /usr/local/bin/terraform_${_terraform_version}_linux_amd64.zip \
    && cd /usr/local/bin/ \
    && unzip terraform_${_terraform_version}_linux_amd64.zip \
    && rm -f /usr/local/bin/terraform_${_terraform_version}_linux_amd64.zip

WORKDIR /home/azure