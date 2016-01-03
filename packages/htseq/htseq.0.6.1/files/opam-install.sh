#!/bin/sh
set -e

PREFIX=$1

# This mess is due to python setup.py install requiring destination
# directory to be in PYTHONPATH
PYTHONVERSION=`python --version 2>&1 |grep -o '[0-9]\.[0-9]'`
PYTHONLIBDIR=$PREFIX/lib/python${PYTHONVERSION}/site-packages
export PYTHONPATH=$PYTHONLIBDIR:$PYTHONPATH

mkdir -p $PYTHONLIBDIR
python setup.py install --prefix ${PREFIX} --record $PYTHONLIBDIR/htseq.install
