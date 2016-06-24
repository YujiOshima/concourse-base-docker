FROM debian:jessie
ENV CONCOURSE_VERSION 1.3.1
MAINTAINER Yuji Oshima

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o /usr/local/bin/concourse -sSL \
        "https://github.com/concourse/concourse/releases/download/v$CONCOURSE_VERSION/concourse_linux_amd64" && \
    chmod +x /usr/local/bin/concourse

ENTRYPOINT ["/usr/local/bin/concourse"]
