#/bin/sh

set -e

./spades_compile.sh
echo "bin: [" > spades.install
find bin -type f | gawk '{ printf "  \"%s\"\n",$1}' >> spades.install
echo "]" >> spades.install

echo "share: [" >> spades.install
find share/spades -type f \
    | sed "s|share/spades/||g" \
    | gawk '{ printf "  \"share/spades/%s\" { \"%s\" }\n",$1,$1}' \
    >> spades.install
echo "]" >> spades.install
