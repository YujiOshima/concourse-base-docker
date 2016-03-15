FROM debian:jessie
ENV CONCOURSE_VERSION 0.75.0
MAINTAINER Vy-Shane Xie

RUN apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -o /usr/local/bin/concourse -sSL \
        "https://github.com/concourse/concourse/releases/download/v$CONCOURSE_VERSION/concourse_linux_amd64" && \
    chmod +x /usr/local/bin/concourse

ENTRYPOINT ["/usr/local/bin/concourse"]
