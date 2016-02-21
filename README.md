# OPAM repository for bioinformatics tools

Biopam provides the ability to install many bioinformatics packages
with relative ease. For example, to install `samtools`, you need only
type `opam install samtools`. Packages' source code are automatically
downloaded, and their libraries, executables, and documentation are
automatically built and installed. Everything goes under the single
directory `~/.opam`, which you can delete to remove all effects of
using biopam if desired. This work makes use of the excellent
[OPAM](http://opam.ocaml.org) package manager, which is widely used
for packages in other domains also.

The rest of this documentation is targeted at 3 audiences:

1. Users - Data analysts in the field of biology who wish to use
   various bioinformatics tools. The subsequent section provides all
   the information you need to make effective use of Biopam. You can
   largely ignore all other content of this repo.

2. Package Developers - If biopam doesn't have a package you need, you
   can submit a pull request to add one. In this case, you will need
   to understand how a package is specified. The `packages/` directory
   of this repo is largely what is relevant to you.

3. Tool Developers - Some code is available to test packages and help
   package developers. This code is implemented in the `bin/`
   directory.


## Users

Biopam makes use of the `opam` tool, so you must first install
that. The quickest way is to grab one of their [binary
releases](https://github.com/ocaml/opam/releases). Download the binary
corresponding to your architecture, put it somewhere in your PATH, and
rename the executable to `opam` (if you don't understand these
instructions, please ask a colleague comfortable with Unix for
assistance). For other options, see the full installation instructions
[here](http://opam.ocaml.org/doc/Install.html).

Once you have `opam` installed, you need to initialize it and tell it
to look for the package descriptions provided by `biopam` by doing:

```
opam init -n --compiler=0.0.0 biopam https://github.com/solvuu/biopam
```

That's it. Now you can start installing packages, e.g.

```
opam install bwa samtools picard
```

Run `opam --help` for more commands and options. Some immediately
useful ones are:

- `opam list -a` to print a list of all available packages.

- `opam info <pkg>` to see information about a particular package,
  replace \<pkg\> with the actual name of a package.

- `opam install <pkg>.<version>` to install a specific version of a
  package. For example, `opam install samtools.0.1.19` will install
  that version even though more recent versions are available.

- `opam switch -A 0.0.0 <my-project>` to create an installation for a
  specific project with a name of your choice. Now you can install
  particular versions of various tools as needed for this
  project. Create another switch for another project, and you can
  cleanly maintain different sets of tools for different projects.


## Package Developers
See packaging instructions on [OPAM's
site](http://opam.ocaml.org/doc/Packaging.html), and submit pull
requests.


## Tool Developers
See code under the `bin/` directory.


## License
We follow the main [OPAM
repository](https://github.com/ocaml/opam-repository), and release all
metadata contained in this repository under the [CC0 1.0
Universal](http://creativecommons.org/publicdomain/zero/1.0/)
license. Please understand this license regards only the descriptions
of packages as provided in this repo. The licenses of the tools that
biopam lets you install is of course dictated by their respective
authors.
