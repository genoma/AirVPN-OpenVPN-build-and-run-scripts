#!/bin/sh

/usr/sbin/networksetup -setdnsservers Wi-Fi empty
/usr/sbin/networksetup -setsearchdomains Wi-Fi empty
/sbin/pfctl -Fa -f /etc/pf.conf -d
# Clear DNS cache
sudo /usr/bin/killall -HUP mDNSResponder
sudo /usr/bin/dscacheutil -flushcache
