FROM andyshinn/dnsmasq:2.76

RUN echo -e "conf-dir=/etc/dnsmasq,*.conf\nlog-dhcp\nlog-queries" >> /etc/dnsmasq.conf

EXPOSE 53/tcp 53/udp
