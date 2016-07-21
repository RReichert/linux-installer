#!/bin/bash -e

# control variables
APP_NAME='ruby version manager'

# check user privilege
sudo -v

# display start message
echo "installing $APP_NAME..."

# install dependencies using apt-get package manager
sudo -E dnf -y install curl

# install rvm
command curl -sSL https://rvm.io/mpapis.asc | sudo gpg --import -
\curl -sSL https://get.rvm.io | sudo bash -s stable

# add user to rvm group
sudo usermod -a -G rvm rodrigor

# display end message
echo "installed $APP_NAME"
