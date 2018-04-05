FROM alpine:3.6

COPY ./files/Makefile /data/
COPY ./files/Markdown.pl /usr/local/bin
COPY ./files/template /data/template/
COPY run.sh /usr/local/bin

RUN apk --no-cache add inotify-tools nginx make perl \
 && chmod +x /usr/local/bin/run.sh \
 && chmod +x /usr/local/bin/Markdown.pl

WORKDIR /data
CMD sh /usr/local/bin/run.sh
