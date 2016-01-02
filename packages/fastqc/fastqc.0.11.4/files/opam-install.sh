#!/bin/sh
set -e

LIB_DIR=$1
BIN_DIR=$2

mkdir $LIB_DIR
cp -Rp bin/* $LIB_DIR/
chmod 755 $LIB_DIR/fastqc

mkdir -p $BIN_DIR
ln -s $LIB_DIR/fastqc $BIN_DIR/fastqc
