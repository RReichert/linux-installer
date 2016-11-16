#!/bin/bash -e

# check user privilege
sudo -v

# qt version to compile/install
PREFIX=/opt/qt
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
		./configure \
			-prefix "${PREFIX}/${VERSION}" \
			-opensource \
			-confirm-license \
			-debug \
			-syslog \
			-system-sqlite \
			-plugin-sql-psql \
			-plugin-sql-mysql \
			-plugin-sql-sqlite \
			-plugin-sql-sqlite2 \
			-skip qtwebengine
		make -j5
		sudo make install

	popd > /dev/null

popd > /dev/null

# register qt5 library with ldconfig
cat <<EOF | sudo tee "/etc/ld.so.conf.d/qt5" > /dev/null
/opt/qt5/lib
EOF
sudo ldconfig

# update qt5 library
ln -sfn "${PREFIX}/${VERSION}" /opt/qt5

