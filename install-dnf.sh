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
	alsa-lib-devel \
	armadillo-devel \
	automake \
	banshee \
	bison \
	boost \
	boost-devel \
	cmake \
	cups-devel \
	curl \
	dbus \
	dbus-devel \
	docker \
	doxygen \
	eclipse-jdt \
	flex \
	fontconfig-devel \
	gcc \
	gcc-c++ \
	gimp \
	git \
	google-chrome-stable \
	gperf \
	graphviz \
	inotify-tools \
	kernel-devel \
	libcap-devel \
	libgcrypt \
	libgcrypt-devel \
	libgudev1-devel \
	libicu-devel \
	libX11-devel \
	libxcb \
	libxcb-devel \
	libXcomposite-devel \
	libXcursor-devel \
	libXi-devel \
	libXrandr-devel \
	libXrender-devel \
	libxslt-devel \
	libXtst-devel \
	make \
	moreutils \
	nss-devel \
	openssh-server \
	p7zip \
	pciutils-devel \
	pulseaudio-libs-devel \
	socat \
	swig \
	systemd-devel \
	valgrind \
	vim-enhanced \
	VirtualBox \
	vlc \
	xcb-util \
	"xcb-util-*-devel" \
	xcb-util-devel \
	xmlstarlet

# install codecs
#sudo dnf install gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-bad-free gstreamer1-plugins-bad-freeworld gstreamer1-plugins-bad-free-extras ffmpeg

