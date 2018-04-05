FROM alpine:3.6

RUN apk --no-cache add inotify-tools nginx

VOLUME /data
WORKDIR /data

COPY files/template /data
COPY files/Makefile /data
COPY run.sh /data
CMD sh run.sh
