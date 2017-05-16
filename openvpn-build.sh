#!/bin/sh

cd ~/openvpn
make clean
autoreconf -i -v -f
# Libressl
./configure --disable-debug --disable-dependency-tracking --disable-silent-rules --with-crypto-library=openssl OPENSSL_LIBS="-L/usr/local/opt/libressl/lib -lssl -lcrypto" OPENSSL_CFLAGS="-I/usr/local/opt/libressl/include"

# Openssl
# ./configure --disable-debug --disable-dependency-tracking --disable-silent-rules --with-crypto-library=openssl OPENSSL_LIBS="-L/usr/local/opt/openssl/lib -lssl -lcrypto" OPENSSL_CFLAGS="-I/usr/local/opt/openssl/include"

make -j4
make install
