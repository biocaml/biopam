#!/bin/bash
# A bash interpreter is useful to read MACHTYPE (see below).
# The build only produces binaries, and all binaries are produced in a
# local bin directory.
set -e

BINDIR=`pwd`/bin
MACHTYPE=`echo ${MACHTYPE} | cut -d '-' -f 1`
MYSQLLIBS=`mysql_config --libs`
MYSQLINC=`mysql_config --include | sed -e 's/-I//g'`

make -C src userApps \
    BINDIR="${BINDIR}" \
    SCRIPTS="${BINDIR}" \
    MACHTYPE="${MACHTYPE}" \
    MYSQLLIBS="${MYSQLLIBS} -lz" \
    MYSQLINC="${MYSQLINC}"
make -C src/hg/gpToGtf \
    BINDIR="${BINDIR}" \
    SCRIPTS="${BINDIR}" \
    MACHTYPE="${MACHTYPE}" \
    MYSQLLIBS="${MYSQLLIBS} -lz" \
    MYSQLINC="${MYSQLINC}"
