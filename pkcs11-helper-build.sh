#!/bin/sh

cd ~/pkcs11-helper

# Cleanup
make clean
make distclean

# Build a config file
autoreconf -i -v -f

# Configure
./configure --disable-debug --disable-dependency-tracking --disable-threading --disable-slotevent --disable-shared

# Make and install
make install
