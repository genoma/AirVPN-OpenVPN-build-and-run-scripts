#!/bin/sh

cd ~/openssl
make clean
./Configure darwin64-x86_64-cc no-ssl2 zlib-dynamic shared enable-cms
make depend
make test
make install
