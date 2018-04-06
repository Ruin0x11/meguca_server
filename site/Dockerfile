FROM nginx:stable

RUN apt-get update \
      && apt-get -y install --no-install-recommends inotify-tools make perl 

RUN mkdir -p /data/site/ \
      && chown -R 1000:1000 /data

COPY ./files/Makefile /data/site
COPY ./files/Markdown.pl /usr/local/bin
COPY ./files/template /data/template/
COPY ./files/nginx.conf /etc/nginx/nginx.conf
COPY run.sh /usr/local/bin

RUN chmod +x /usr/local/bin/run.sh \
      && chmod +x /usr/local/bin/Markdown.pl \
      && chown -R 1000:1000 /var/cache/nginx \
      && chown -R 1000:1000 /run 

WORKDIR /data
CMD sh /usr/local/bin/run.sh
