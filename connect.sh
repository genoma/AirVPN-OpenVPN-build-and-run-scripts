#!/bin/sh

# Change the DNS with the choosen protocol as per README.md
/usr/sbin/networksetup -setdnsservers Wi-Fi 10.50.0.1
/usr/sbin/networksetup -setsearchdomains Wi-Fi openvpn
/sbin/pfctl -Fa -f killswitch.pf.conf -e
# Clear DNS cache
sudo /usr/bin/killall -HUP mDNSResponder
sudo /usr/bin/dscacheutil -flushcache
