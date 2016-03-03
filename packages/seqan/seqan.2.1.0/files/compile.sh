#!/bin/sh
set -e

mkdir -p _build
cd _build
cmake .. -DSEQAN_BUILD_SYSTEM=SEQAN_RELEASE_APPS
make alf dfi razers razers3
