ARCH=amd64
PYTHON=http://python.org/ftp/python
PYPI=http://pypi.python.org/packages

apt-get -y install libssl-dev libreadline5-dev zlib1g-dev

for VERSION in 2.5.5 2.6.4 3.1.1; do
	PREFIX=/tmp/python-$VERSION-$$
	V=$(echo $VERSION | sed -r 's/^([0-9]+\.[0-9]+).*$/\1/')

	debra create $PREFIX

	cat <<EOF >$PREFIX/DEBIAN/control
Package: opt-python-$VERSION
Version: $VERSION-1
Section: devel
Priority: optional
Essential: no
Architecture: amd64
Depends: libc6, libssl0.9.8, libreadline5, zlib1g
Maintainer: Richard Crowley <r@rcrowley.org>
Description: Standalone Python $VERSION.  This installation includes the setuptools and pip packages from PyPI.
EOF

	# Install Python itself.
	debra sourceinstall $PREFIX \
		$PYTHON/$VERSION/Python-$VERSION.tar.bz2

	# Install setuptools and pip unless this is Python 3000, which still
	# hasn't gotten any love.
	if echo $VERSION | egrep '^2' >/dev/null; then
		(cd $PREFIX && wget \
			$PYPI/$V/s/setuptools/setuptools-0.6c11-py$V.egg)
		PATH="$PREFIX/opt/Python-$VERSION/bin:$PATH" sh \
			$PREFIX/setuptools-0.6c11-py$V.egg \
			--prefix=$PREFIX/opt/Python-$VERSION
		rm $PREFIX/setuptools-0.6c11-py$V.egg
		sourceinstall $PREFIX/opt/Python-$VERSION \
			$PYPI/source/p/pip/pip-0.6.2.tar.gz \
			-c "$PREFIX/opt/Python-$VERSION/bin/python setup.py install"
	fi

	# Build a Debian package.
	debra build $PREFIX opt-python-${VERSION}_${VERSION}-1_$ARCH.deb

	rm -rf $PREFIX
done
