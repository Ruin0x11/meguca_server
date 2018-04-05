FROM alpine:3.6

RUN apk --no-cache add inotify-tools nginx make wget openssl-dev unzip perl \
  && wget --no-check-certificate -O /tmp/md.zip "http://daringfireball.net/projects/downloads/Markdown_1.0.1.zip" \
  && unzip -p /tmp/md.zip Markdown_1.0.1/Markdown.pl > /usr/local/bin/Markdown.pl \
  && chmod +x /usr/local/bin/Markdown.pl

COPY ./files/Makefile /data/
COPY ./files/template /data/template/
COPY run.sh /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

WORKDIR /data
CMD sh /usr/local/bin/run.sh
