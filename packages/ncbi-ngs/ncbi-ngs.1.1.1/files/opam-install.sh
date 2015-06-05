#!/bin/sh
set -e

LIB_DIR=$1
SHARE_DIR=$2

mkdir $LIB_DIR
cp -Rp ngs-sdk/foo/lib64/* $LIB_DIR/
cp -Rp ngs-sdk/foo/include/ngs $LIB_DIR/

mkdir $SHARE_DIR
cp -Rp ngs-sdk/foo/share/* $SHARE_DIR/
