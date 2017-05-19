#!/bin/sh

cd ~/pkcs11-helper

make clean

autoreconf -i -v -f

./configure --disable-debug --disable-dependency-tracking --disable-threading --disable-slotevent --disable-shared OPENSSL_LIBS="-L/usr/local/opt/openssl/lib -lssl -lcrypto" OPENSSL_CFLAGS="-I/usr/local/opt/openssl/include"

make install
