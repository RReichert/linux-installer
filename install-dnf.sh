#!/bin/bash -e

# check user privilege
sudo -v

# add google repository
sudo cat <<EOF | sudo tee "/etc/yum.repos.d/google-chrome.repo" > /dev/null
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

# add rpm fusion repositories
sudo -E dnf -y install http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo -E dnf -y install http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# upgrade system
sudo -E dnf -y upgrade

# install packages
sudo -E dnf -y install \
	armadillo-devel \
	automake \
	banshee \
	boost \
	boost-devel \
	cmake \
	curl \
	docker \
	doxygen \
	eclipse-jdt \
	gcc \
	gcc-c++ \
	gimp \
	git \
	google-chrome-stable \
	graphviz \
	kernel-devel \
	inotify-tools \
	make \
	moreutils \
	openssh-server \
	p7zip \
	qt5-\* \
	qt-creator \
	redshift \
	redshift-gtk \
	socat \
	swig \
	valgrind \
	vim-enhanced \
	VirtualBox \
	vlc \
	xmlstarlet

# install codecs
#sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg

