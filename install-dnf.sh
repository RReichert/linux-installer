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
	boost \
	boost-devel \
	cmake \
	docker \
	doxygen \
	gcc \
	gcc-c++ \
	gimp \
	git \
	google-chrome-stable \
	inotify-tools \
	kernel-devel \
	make \
	moreutils \
	openssh-server \
	socat \
	swig \
	valgrind \
	vim-enhanced \
	VirtualBox \
	vlc \
	xmlstarlet

# install codecs
sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg gstreamer1-libav gstreamer1-plugin-openh264 gstreamer1-plugin-mpg123

