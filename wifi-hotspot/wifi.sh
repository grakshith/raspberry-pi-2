#! /bin/bash
ifconfig wlan0 192.168.0.1

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT

hostapd -dd /etc/hostapd/hostapd.conf
