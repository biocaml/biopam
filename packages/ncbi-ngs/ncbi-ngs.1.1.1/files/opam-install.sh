#!/bin/sh
set -e

LIB_DIR=$1
SHARE_DIR=$2

mkdir $LIB_DIR
cp -Rp ngs-sdk/_install/lib64/* $LIB_DIR/
cp -Rp ngs-sdk/_install/include/ngs $LIB_DIR/

mkdir $SHARE_DIR
cp -Rp ngs-sdk/_install/share/* $SHARE_DIR/
