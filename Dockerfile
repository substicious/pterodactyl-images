FROM openjdk:17-jdk-alpine

RUN apk add --update --no-cache curl ca-certificates openssl git tar bash sqlite fontconfig tzdata \
    && adduser -D -h /home/container container \
    && ln -s /etc/localtime /etc/timezone

USER container
ENV USER=container HOME=/home/container

ENV JAVA_HOME=/opt/openjdk-17

ENV PATH=/opt/openjdk-17/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

ENV JAVA_VERSION=17-ea+14

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
