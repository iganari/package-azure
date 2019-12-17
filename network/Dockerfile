FROM azuresdk/azure-cli-python

MAINTAINER iganari

# https://github.com/hashicorp/terraform/releases
ARG _tf_var='0.12.18'
RUN curl https://releases.hashicorp.com/terraform/${_tf_var}/terraform_${_tf_var}_linux_amd64.zip -o /usr/local/bin/terraform_${_tf_var}_linux_amd64.zip && \
    cd /usr/local/bin/ && \
    unzip terraform_${_tf_var}_linux_amd64.zip && \
    rm -f /usr/local/bin/terraform_${_tf_var}_linux_amd64.zip
