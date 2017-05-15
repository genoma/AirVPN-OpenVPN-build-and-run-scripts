AirVPN for OSX and OpenVPN compiled from source
===============================================

## Build OpenVPN
Clone the OpenVPN repository (master or checkout a TAG to build stable release)

`$ git clone https://github.com/OpenVPN/openvpn.git`

Install dependencies with HOMEBREW

`$ brew install automake autoconf libtool pkg-config libressl openssl lzo lz4 stunnel`

Call the compiler script `$ ./openvpn-build.sh`

## Patch the ovpn configuration downloaded from AirVPN

`AirVPN_WhateverIsTheName.ovpn < patch-ovpn.patch`

## Start your OpenVPN

`$ sudo openvpn AirVPN_WhateverIsTheName.ovpn`

## DNS LIST
Protocol                  IP        DNS
Port 443  - Protocol UDP	10.4.*.*	10.4.0.1
Port 443  - Protocol TCP	10.5.*.*	10.5.0.1
Port 80   - Protocol UDP	10.6.*.*	10.6.0.1
Port 80   - Protocol TCP	10.7.*.*	10.7.0.1
Port 53   - Protocol UDP	10.8.*.*	10.8.0.1
Port 53   - Protocol TCP	10.9.*.*	10.9.0.1
Port 2018 - Protocol UDP	10.30.*.*	10.30.0.1

Port 2018 - Protocol TCP
Port 2018 - Protocol SSH
Port 2018 - Protocol SSL	10.50.*.*	10.50.0.1

## Closed Terminal

If you accidentally or voluntarily close the terminal, you can kill the OpenVPN processl later with:

`sudo killall -2 openvpn`
