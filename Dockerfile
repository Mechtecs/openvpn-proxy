FROM dperson/openvpn-client

ENV OPENVPN_CONFIG=""
ENV PROXY_HOST=""
ENV PROXY_PORT=""

RUN apk --no-cache --no-progress add iptables bash

COPY ./start.sh /start.sh

CMD ["bash", "/start.sh"]
