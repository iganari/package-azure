
FROM azuresdk/azure-cli-python

MAINTAINER iganari

RUN curl https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip -o /usr/local/bin/terraform_0.12.12_linux_amd64.zip && \
    cd /usr/local/bin/ && \
    unzip terraform_0.12.12_linux_amd64.zip && \
    rm -f /usr/local/bin/terraform_0.12.12_linux_amd64.zip