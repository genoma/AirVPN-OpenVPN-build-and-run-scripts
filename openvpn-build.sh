#!/bin/sh

cd ~/openvpn

# Cleanup tasks
make clean
make distclean

# Build a configure script
autoreconf -i -v -f

# Build OpenVPN with OpenSSL
./configure --disable-debug --disable-dependency-tracking --disable-silent-rules --enable-pkcs11 --with-crypto-library=openssl

# Make and install OpenVPN
make -j4
make install
