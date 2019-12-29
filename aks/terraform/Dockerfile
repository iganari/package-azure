FROM mcr.microsoft.com/azure-cli
# https://hub.docker.com/_/microsoft-azure-cli

MAINTAINER iganari
LABEL maintainer="iganari"


ARG VCS_REF
ARG BUILD_DATE

# # Metadata
# LABEL org.label-schema.vcs-ref=$VCS_REF \
#       org.label-schema.vcs-url="https://github.com/lachie83/k8s-kubectl" \
#       org.label-schema.build-date=$BUILD_DATE \
#       org.label-schema.docker.dockerfile="/Dockerfile"


# ### setting timezone
# RUN apk --update add tzdata && \
#     cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
#     apk del tzdata && \
#     rm -rf /var/cache/apk/*
# 
# ### install apk
# RUN apk update &&\
#     apk --update add vim \
#                      terraform
# 
# 
# # RUN echo '' >> /root/.bashrc &&\
# #     echo 'export PS1="\[\033[1;33m\][\u@cl-az-default \W]\\$\[\033[0m\] "' >> /root/.bashrc &&\
# #     echo 'alias ll="ls -al"' >> /root/.bashrc
# 
# ### add setting
# RUN curl https://gist.githubusercontent.com/iganari/a2baec1af976425cc8e21ccd68cf5585/raw/b6fce2cc91e1c77da759af1d2ea7b771b597787f/_vimrc -o /root/.vimrc
# 
# # https://github.com/lachie83/k8s-kubectl
# ENV KUBE_LATEST_VERSION="v1.15.1"
# RUN apk add --update ca-certificates && \
#     apk add --update -t deps curl && \
#     curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
#     chmod +x /usr/local/bin/kubectl && \
#     apk del --purge deps && \
#     rm /var/cache/apk/*
# 