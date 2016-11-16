#!/bin/bash -e

# check user privilege
sudo -v

# qt creator version to compile/install
VERSION=4.1.0

# create workspace
if [ ! -d "${HOME}/Workspace/github" ] ; then
	mkdir -p "${HOME}/Workspace/github"
fi

# change directory to workspace
pushd "${HOME}/Workspace/github" > /dev/null

	# download repository
	if [ ! -d qt-creator ] ; then
		git clone git://code.qt.io/qt-creator/qt-creator.git
	fi

	# change directory to repository
	pushd qt-creator > /dev/null

		# clean up repostiroy
		git fetch
		git checkout -f "v${VERSION}"
		git clean -dfx

		# create build forlder
		mkdir qt-creator-build

		# change directory to build folder
		pushd qt-creator-build > /dev/null

			# configure, compile & install
			qmake -r ../qt-creator/qtcreator.pro
			make -j4
			sudo make install INSTALL_ROOT=/opt/qt-creator

		popd > /dev/null

	popd > /dev/null

popd > /dev/null

