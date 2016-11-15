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
	aspectc++ \
	bison \
	build-essential \
	cmake \
	curl \
	docker.io \
	doxygen \
	flex \
	freeglut3-dev \
	gimp \
	git \
	google-chrome-stable \
	gperf \
	graphviz \
	inotify-tools \
	libarmadillo-dev \
	libasound2-dev \
	libatkmm-1.6-dev \
	libboost-all-dev \
	libbz2-dev \
	libcap-dev \
	libcups2-dev \
	libdrm-dev \
	libegl1-mesa-dev \
	libfontconfig1-dev \
	libgcrypt11-dev \
	libglu1-mesa-dev \
	libgstreamer0.10-dev \
	libgstreamer-plugins-base0.10-dev \
	libicu-dev \
	libmysqlclient-dev \
	libnss3-dev \
	libpci-dev \
	libpq-dev \
	libpulse-dev \
	libsqlite0-dev \
	libsqlite3-dev \
	libssl-dev \
	libudev-dev \
	libx11-xcb-dev \
	"^libxcb.*" \
	libxcomposite-dev \
	libxcursor-dev \
	libxdamage-dev \
	libxerces-c-dev \
	libxi-dev \
	libxrandr-dev \
	libxrender-dev \
	libxslt-dev \
	libxss-dev \
	libxtst-dev \
	mesa-common-dev \
	moreutils \
	mysql-client \
	openssh-server \
	p7zip \
	perl \
	postgresql-client \
	python \
	socat \
	sqlite3 \
	swig \
	valgrind \
	vim \
	virtualbox \
	vlc \
	xmlstarlet

