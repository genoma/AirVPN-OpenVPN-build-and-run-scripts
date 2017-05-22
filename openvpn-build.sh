#!/bin/sh

cd ~/openvpn
make clean
autoreconf -i -v -f

# Libressl
# ./configure --disable-debug --disable-dependency-tracking --disable-silent-rules --enable-pkcs11 --with-crypto-library=openssl OPENSSL_LIBS="-L/usr/local/opt/libressl/lib -lssl -lcrypto" OPENSSL_CFLAGS="-I/usr/local/opt/libressl/include"

# åOpenssl
./configure --disable-debug --disable-dependency-tracking --disable-silent-rules --enable-pkcs11 --with-crypto-library=openssl OPENSSL_LIBS="-L/usr/local/ssl/lib" OPENSSL_CFLAGS="-I/usr/local/ssl/include"

make -j4
make install
