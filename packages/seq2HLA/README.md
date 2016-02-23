# Install Notes

[Seq2HLA](https://bitbucket.org/sebastian_boegel/seq2hla) is a Python script
used to perform HLA typing from RNA-sequences. The script, as written,
currently, requires to work in the directory where the script is installed.
We avoid this requirement by wrapping the script into a standalone executable
using [pyinstaller](http://www.pyinstaller.org/). This allows the user to
run the executable, `seq2HLA` whereever their RNA data is located.
