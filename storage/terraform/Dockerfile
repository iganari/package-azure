# ARG _TAG=latest
FROM azuresdk/azure-cli-python
# https://hub.docker.com/r/microsoft/azure-cli

MAINTAINER iganari

# # OS Prepare
# # setting timezone
# RUN apk --update add tzdata && \
#     cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
#     apk del tzdata && \
#     rm -rf /var/cache/apk/*

RUN curl https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip -o /usr/local/bin/terraform_0.12.12_linux_amd64.zip && \
    cd /usr/local/bin/ && \
    unzip terraform_0.12.12_linux_amd64.zip && \
    rm -f /usr/local/bin/terraform_0.12.12_linux_amd64.zip
