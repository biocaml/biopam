# Install Notes
We normally avoid using `install` commands provided by packages. Here
we do run `make install`, but this is only to move files from `_build`
to `_install`. The `_build` directory structure is more complex, so it
would be harder for us to figure out how to install files directly
from there.

Also, we install the `interfaces` and `_build` directories because
this is needed by `ncbi-sra-tools`. This is a vestige from the time
all three NCBI libraries (ngs, vdb and sra-tools) were a single
entity. This [should be
fixed](https://github.com/ncbi/ncbi-vdb/issues/3) in the long run. We
do this part with `cp` instead of listing the files in the `.install`
file.

We also manually remove directories `%{ncbi-vdb:lib}%/lib64` and
`%{ncbi-vdb:lib}%/ncbi-vdb` due to a bug in OPAM that fails to remove
empty directories. This should not be required since these
directories' contents are represented entirely in the `.install` file.

The external dependencies `libhdf5-dev` and `libxml2-dev` are
optional, but we've declared them as required. It would take some more
work to let them be optional.


## Version 2.5.0
Not supporting this version. There is an error in its `make install`
command. The result includes some broken links.
