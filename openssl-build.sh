#!/bin/sh

cd ~/openssl

# Cleanup
make clean
make distclean

# Configure with the correct architecture
./Configure darwin64-x86_64-cc no-ssl2 zlib-dynamic shared enable-cms

# Make, test and install
make depend
make test
make install
