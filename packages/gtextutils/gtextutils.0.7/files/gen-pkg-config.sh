#!/bin/sh

OUTFILE=gtextutils.pc
PREFIX=`opam config var prefix`

echo "exec_prefix=${PREFIX}/bin" > $OUTFILE
echo "libdir=${PREFIX}/lib/gtextutils" >> $OUTFILE
echo "includedir=${PREFIX}/lib/gtextutils" >> $OUTFILE
echo "" >> $OUTFILE
echo "Name: gtextutils" >> $OUTFILE
echo "Description: Gordon's text-utility classes" >> $OUTFILE
echo "Version: 0.7" >> $OUTFILE
echo "Libs: -L\${libdir} -lgtextutils" >> $OUTFILE
echo "Cflags: -I\${includedir}" >> $OUTFILE
