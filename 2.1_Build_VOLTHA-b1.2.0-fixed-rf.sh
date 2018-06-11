#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for build VOLTHA 
# JC Yu,     June 07,2018
# -------------------------------------------------------
VOLTHA_DIR=voltha-b1.2.0-fixed-rf

tar zxvf voltha-b1.2.0-fixed-rf-2018-0606.tar.gz
cd ${VOLTHA_DIR}
. env.sh
make fetch
make install-protoc
make build
cd  ..
  







