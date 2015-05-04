OPAM repository for bioinformatics packages.

[OPAM](http://opam.ocaml.org) is a package manager intended for OCaml
libraries. However, it is perfectly possible to use it for non-OCaml
packages, and that is what this repository does by providing various
bioinformatics packages implemented in other languages.

To use this repository simply do:

```
opam repository add biopam https://github.com/solvuu/biopam.git
```

Then, you can start installing packages, e.g.

```
opam install bwa samtools picard
```

## Contribute

Please fork and submit pull requests at
[GitHub](https://github.com/solvuu/biopam).


## License

We follow the main [OPAM
repository](https://github.com/ocaml/opam-repository), and release all
metadata contained in this repository under the [CC0 1.0
Universal](http://creativecommons.org/publicdomain/zero/1.0/) license.
