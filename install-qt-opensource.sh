#!/bin/bash -e

# check user privilege
sudo -v

# qt version to compile/install
VERSION=5.7.0

# check pre-requisites
if ! command -v git > /dev/null ; then
	>&2 echo "error: git is not installed in your system"
	exit 1
fi

# assure workspace exists
if [ ! -d "${HOME}/Workspace/github" ] ; then
	mkdir -p "${HOME}/Workspace/github"
fi

# jump into workspace
pushd "${HOME}/Workspace/github" > /dev/null

	# download repository
	if [ ! -d qt5 ] ; then 
		git clone git://code.qt.io/qt/qt5.git
	fi
	
	# jump into repository
	pushd qt5 > /dev/null
	
		# repository setup
		git fetch
		git checkout -f "v${VERSION}"
		git submodule update  --init --recursive
		git submodule foreach --recursive "git clean -dfx" && git clean -dfx
		
		# compile & install
		./configure -prefix "/opt/qt/${VERSION}" -opensource -confirm-license
		make -j 4	
	
	popd > /dev/null
	
popd > /dev/null

