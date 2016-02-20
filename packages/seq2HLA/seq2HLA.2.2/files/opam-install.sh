#!/bin/sh
set -e

# The opam lists the following as depext
# 1. Python 2.7   - necessary for pyinstaller below and checked via conf-python-2.7
# 2. R            - checked via conf-R
# 3. pyinstaller  - 'checked' by failing below

LIB=$1/seq2HLA
BIN=$2
INSTALLED_LIB=$LIB/dist/seq2HLA

# patch the hardcoded paths to point at the future dir
sed -i.bak "s|os.path.abspath(os.path.dirname(sys.argv\[0\]))|\"$INSTALLED_LIB\"|g" seq2HLA.py
sed -i.bak "s|os.path.abspath(os.path.dirname(sys.argv\[0\]))|\"$INSTALLED_LIB\"|g" fourdigits.py

# Catch the stderr to see if Bio is not installed
pyinstaller --onedir --log-level ERROR --hidden-import Bio seq2HLA.py 2>install.log
if grep Bio install.log ; then
  echo "Make sure that Biopython is installed" 1>&2 
  exit 1
fi

mkdir -p $LIB
cp -r dist $LIB

# Copy the R, and other reference file since pyinstaller can't see these scripts
cp *.R *.dbmhc $INSTALLED_LIB
cp -R references $INSTALLED_LIB
ln -s $INSTALLED_LIB/seq2HLA $BIN/seq2HLA
