#!/bin/bash -e

# check user privilege
sudo -v

# add google repository
wget -q -O - 'https://dl-ssl.google.com/linux/linux_signing_key.pub' | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'

# update apt-get cache
sudo -E apt-get update

# install packages
sudo -E apt-get -y install \
	build-essential \
	cmake \
	curl \
	docker.io \
	doxygen \
	freeglut3-dev \
	gimp \
	git \
	google-chrome-stable \
	graphviz \
	inotify-tools \
	libarmadillo-dev \
	libboost-all-dev \
	libglu1-mesa-dev \
	mesa-common-dev \
	moreutils \
	openssh-server \
	p7zip \
	socat \
	swig \
	valgrind \
	vim \
	virtualbox \
	vlc \
	xmlstarlet

