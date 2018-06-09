FROM alpine:3.7

ARG LIBEVENT_VERSION=2.1.8-stable

RUN mkdir -p /srv/out \
 && apk update \
 && apk add alpine-sdk ncurses-dev ncurses-static \
 && rm -rf /var/cache/apk \
 && mkdir /var/tmp/build \
 && cd /var/tmp/build \
 && curl -fsSLO "https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz" \
 && tar xzf "libevent-${LIBEVENT_VERSION}.tar.gz" \
 && cd "libevent-${LIBEVENT_VERSION}" \
 && ./configure --enable-static \
 && make -j \
 && make install \
 && cd / \
 && rm -r /var/tmp/build

VOLUME /srv/out
WORKDIR /srv
COPY build.sh /root/

ENTRYPOINT /root/build.sh
