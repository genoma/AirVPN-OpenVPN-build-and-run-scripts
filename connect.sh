#!/bin/sh

/usr/sbin/networksetup -setdnsservers Wi-Fi 10.4.0.1
/usr/sbin/networksetup -setsearchdomains Wi-Fi openvpn
/sbin/pfctl -Fa -f killswitch.pf.conf -e
