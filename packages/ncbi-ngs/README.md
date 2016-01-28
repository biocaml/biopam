# Install Notes
The source code contains several sub-projects. The base project is
`ngs-sdk` and then there are `ngs-bam`, `ngs-java`, and `ngs-python`,
which depend on this. The top `configure` file is supposed to let you
configure all projects in one go, but there is a known
[bug](https://github.com/ncbi/ngs/issues/1). We workaround this by
directly invoking `ngs-sdk/configure`, and further, only installing
this project. Please submit an issue if you'd like the other
sub-projects installed also.

We normally avoid using `install` commands provided by packages. Here
we do run `make install`, but this is only to move files from `_build`
to `_install`. The `_build` directory structure is more complex, so it
would be harder for us to figure out how to install files directly
from there.

## Version 1.1.1
Removed this version. There is an error in its `make install`
command. The result includes a broken link, from
`libngs-sdk.1.1.1.dylib` to itself.
