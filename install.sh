#!/bin/bash -e

# check user privilege
sudo -v

# add repositories
sudo cat <<EOF | sudo tee "/etc/yum.repos.d/google-chrome.repo" > /dev/null
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

# upgrade system
sudo dnf -y upgrade

# install packages
sudo dnf -y install \
	automake \
	banshee \
	boost \
	boost-devel \
	cmake \
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
	qt-creator \
	socat \
	swig \
	valgrind \
	vim-enhanced \
	xmlstarlet

#	VirtualBox \
#	vlc \

# install codecs
#sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg

# install external programs
./install_rvm.sh

# exit message
cat <<EOF
Installation Complete

There are a few other things that you will need to do manually:

  1. change the gnome-terminal to startup as a "login shell" (needed for RVM)
  2. as a SUPER USER, run the following to install the latest Ruby

    # source /etc/profile.d/rvm.sh
    # rvm install ruby --latest

EOF

