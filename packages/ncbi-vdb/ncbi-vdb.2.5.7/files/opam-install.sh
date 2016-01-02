#!/bin/sh
set -e

LIB_DIR=$1

mkdir $LIB_DIR
cp -Rp _install/lib64 $LIB_DIR/
cp -Rp _install/include/ncbi-vdb $LIB_DIR/

# The following is needed for package ncbi-sra-tools, because its
# build requires source and build results of ncbi-vdb. This is a
# vestige from the time all three ncbi libraries (ngs, vdb and
# sra-tools) were a single entity. It seems it should be fixed in the
# long run:
# https://github.com/ncbi/ncbi-vdb/issues/3
cp -Rp interfaces $LIB_DIR/
cp -Rp _build $LIB_DIR/
