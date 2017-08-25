#!/bin/sh

cd ~/openssl

# Cleanup
make clean
make distclean

# Configure with the correct architecture
./Configure darwin64-x86_64-cc enable-ec_nistp_64_gcc_128 no-ssl3 no-ssl3-method no-zlib

# Make, test and install
make depend
make install
