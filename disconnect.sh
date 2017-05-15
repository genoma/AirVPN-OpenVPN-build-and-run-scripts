#!/bin/sh

/usr/sbin/networksetup -setdnsservers Wi-Fi empty
/usr/sbin/networksetup -setsearchdomains Wi-Fi empty
/sbin/pfctl -d
