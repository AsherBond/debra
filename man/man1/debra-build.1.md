debra-build(1) -- build a Debian package
========================================

## SYNOPSIS

`debra build` _name_ _deb_ [`-h`]  

## DESCRIPTION

`debra-build` builds a Debian package from a Debra directory.  Before building the Debian package, it scans the Debra directory to correct shebang lines and other common problems, then it calculates the MD5 sum of each file and stores them in `DEBIAN/md5sums`.

## OPTIONS

* _name_:
  Name of a Debra directory.
* _deb_:
  Debian package file to create.
* `-h`, `--help`:
  Show a help message.

## THEME SONG

Beck - "Debra"

## AUTHOR

Richard Crowley <richard@devstructure.com>

## SEE ALSO

Part of `debra`(1).

`debra-create`(1), `debra-sourceinstall`(1), `debra-build`(1), `debra-destroy`(1), `debra-makefile`(1).
