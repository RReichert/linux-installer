#!/bin/bash -e

# check user privilege
sudo -v

# qt version to compile/install
VERSION=5.7.0

# create workspace
if [ ! -d "${HOME}/Workspace/github" ] ; then
	mkdir -p "${HOME}/Workspace/github"
fi

# change directory to workspace
pushd "${HOME}/Workspace/github" > /dev/null

	# download repository
	if [ ! -d qt5 ] ; then
		git clone git://code.qt.io/qt/qt5.git
	fi

	# change directory to repository
	pushd qt5 > /dev/null

		# clean up repostiroy
		git fetch
		git checkout -f "v${VERSION}"
		git submodule update  --init --recursive
		git submodule foreach --recursive "git clean -dfx" && git clean -dfx

		# configure, compile & install qt
		./configure -prefix "/usr/local/qt-${VERSION}" -opensource -confirm-license -debug -syslog -plugin-sql-psql -plugin-sql-mysql -plugin-sql-sqlite -plugin-sql-sqlite2
		make -j5
		sudo make install

	popd > /dev/null

popd > /dev/null

