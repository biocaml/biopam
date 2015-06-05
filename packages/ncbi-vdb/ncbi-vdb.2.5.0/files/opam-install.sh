#!/bin/sh
set -e

LIB_DIR=$1

mkdir $LIB_DIR
cp -Rp _install/lib64/* $LIB_DIR/
cp -Rp _install/include/ncbi-vdb $LIB_DIR/
