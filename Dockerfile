FROM alpine:latest

RUN sed -i -e 's/v[[:digit:]]\..*\//edge\//g' /etc/apk/repositories \
    && apk upgrade --update-cache --available

RUN apk add --update --no-cache curl ca-certificates openssl git tar bash sqlite fontconfig tzdata wine wget \
    && adduser -D -h /home/container container \
    && ln -s /etc/localtime /etc/timezone

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
