#!/bin/sh

set -e

PREFIX=$1

echo '#!/bin/sh' > quast
echo "python $PREFIX/share/quast/quast.py" >> quast
echo "bin: [ \"quast\" ]" > quast.install
echo "share: [" >> quast.install
find . -type f \
    | sed "s|\./||g" \
    | gawk '{ printf "  \"%s\" { \"%s\" }\n",$1,$1}' \
    >> quast.install
echo "]" >> quast.install
