#!/usr/bin/env bash

printf "$OPENVPN_CONFIG" > /vpn/openvpn.ovpn

iptables -A INPUT -p tcp -s 0/0 --dport "$PROXY_PORT" -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -i lo --dport "$PROXY_PORT" -j REDIRECT --to "$PROXY_HOST":"$PROXY_PORT"

/sbin/tini -- /usr/bin/openvpn.sh
