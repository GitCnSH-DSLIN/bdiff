BDiff / BPatch
==============

Binary diff and patch programs for the Windows command line.

Introduction
------------

_BDiff_ computes differences between two binary files. Output can be either a somewhat human-readable protocol in plain text, or a binary file that is readable by _BPatch_.

_BPatch_ applies a binary patch generated by _BDiff_ to a file to recreate the original file.

See the files `BDiff.txt` and `BPatch.txt` in the `Docs` directory for details of how to use the programs.

_BDiff_ and _BPatch_ are derived from Stefan Reuther's _bdiff_ and _bpatch_ v0.2 and a later bug fix by Stefan.

The original C source was translated into Object Pascal by Peter D Johnson ([@delphdabbler](https://twitter.com/delphidabbler)). The programs are are based on updates of the Pascal code base.

The programs should run on any current version of Windows.

For more information see the see the [project web pages](http://delphidabbler.com/software/bdiff).

Installation
------------

Copy the provided executable files to the required location. No further installation is required.

You may want to modify the Windows PATH environment variable to include the location of the programs.

To uninstall simply delete the programs. They make no changes to the system. If you changed the PATH environment variable you may wish to adjust this.

Source Code
-----------

### Pascal Source

The current source code is maintained in the [delphidabbler/bdiff](https://github.com/delphidabbler/bdiff) Git repository on GitHub. It contains releases going back to v0.2.5. Earlier versions were not under version control and are no longer available.

> **Note:** Until February 2014 the source code was maintained in a Subversion repository. A dump of the repo is available from [Google Drive](https://drive.google.com/file/d/0B8qEVqTUMgmJcF9zVnk0Zk1VMDQ/view?usp=sharing).

For information on how to build the Pascal source, see `Build.txt` in the root of the Git repo.

### C Source

The original C source code can be downloaded from http://phost.de/~stefan/Files/bdiff-02.zip.

Copyright and License
---------------------

See the file `LICENCE.md` for details of copyright and the license that applies to this software.

Change Log
----------

The change log is provided in the file `CHANGELOG.txt`.
