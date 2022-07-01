FROM ubuntu/squid:5.2-22.04_beta
RUN apt update
RUN apt install -y iproute2 wireguard
COPY wg0.conf /etc/wireguard/wg0.conf
COPY init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh
RUN sed -i 's/http_access deny CONNECT/#http_access deny CONNECT/g' /etc/squid/squid.conf
ENTRYPOINT ["init.sh"]
CMD ["-f", "/etc/squid/squid.conf", "-NYC"]
