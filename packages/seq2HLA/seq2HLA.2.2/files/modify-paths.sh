#!/bin/sh
set -e

# patch the hardcoded paths to point at the future distribution directory
sed -i.bak "s|os.path.abspath(os.path.dirname(sys.argv\[0\]))|sys._MEIPASS|g" seq2HLA.py
sed -i.bak "s|os.path.abspath(os.path.dirname(sys.argv\[0\]))|sys._MEIPASS|g" fourdigits.py
