#!/bin/sh
set -e

PREFIX=$1

PYTHONVERSION=`python --version 2>&1 |grep -o '[0-9]\.[0-9]'`
PYTHONLIBDIR=$PREFIX/lib/python${PYTHONVERSION}/site-packages

cat $PYTHONLIBDIR/htseq.install | xargs rm -rf
