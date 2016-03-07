There are several files used as part of the `pyinstaller` conversion into a
standalone executable:

  - `OptiTypePipeline.spec` provides the full recipe of how to build Optitype.
    It ensures and fails proactively if necessary dependencies (`numpy`, `pysam`
    ..etc) are missing from the environment.
  - `hook-numpy.py`, `hook-pyomo.py` and `hook-pysam.py` are extra
    modifications that make sure that `hidden` dependencies of those respective
    packages are installed.
  - `optitype.install` - copies over the necessary data and config files.
