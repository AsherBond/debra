debra(8)
========

## SYNOPSIS

	debra create foo
	debra sourceinstall foo http://example.com/package.tar.gz
	debra build foo
	debra destry foo

## DESCRIPTION

Debra is for building Debian packages.

Debra can build a Debian package for itself like so:

	git archive --prefix=debra-0.1.0/ HEAD | gzip >/var/www/static/debra-0.1.0.tar.gz
	export PATH=bin:$PATH
	debra create foo control
	sourceinstall foo/usr/local http://static.rmilitia.com/debra-0.1.0.tar.gz
	debra build foo debra_0.1.0-1_all.deb
	debra destroy foo
	relreso -b /var/packages/ubuntu includedeb karmic debra_0.1.0-1_all.deb
	apt-get update
	apt-get install debra

## FILES

* `$HOME/.debra`:
  The contents of `$HOME/.debra` will be used to initialize the `DEBIAN/control` file during the `init` action.

## AUTHOR

Richard Crowley <r@rcrowley.org>

## SEE ALSO

* <http://github.com/relreso/debra>
* <http://tldp.org/HOWTO/Debian-Binary-Package-Building-HOWTO/>

## THEME SONG

Beck - "Debra"
