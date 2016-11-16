#!/bin/bash -e

# check user privilege
sudo -v

# install distro packages
if command -v apt-get > /dev/null ; then
	./install-apt-get.sh
elif command -v dnf > /dev/null ; then
	./install-dnf.sh
fi

# install external programs
./install-rvm.sh

# exit message
cat <<EOF
Installation Complete

There are a few other things that you will need to do manually:

  1. change the gnome-terminal to startup as a "login shell" (needed for RVM)
  2. run the following scripts as a normal user

    $ ./install-qt-opensource.sh
    $ ./install-qt-creator-opensource.sh

  3. as a SUPER USER, run the following to install the latest Ruby

    # source /etc/profile.d/rvm.sh
    # rvm install ruby --latest

EOF

