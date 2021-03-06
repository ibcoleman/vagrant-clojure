#!/usr/bin/env bash

apt-get update
apt-get install -y software-properties-common
apt-get install -y emacs24 chromium-browser
apt-get install -y default-jdk clojure scala
apt-get install -y x11-xserver-utils xterm fonts-inconsolata
apt-get install -y git subversion


if (test -d /home/vagrant/.emacs.d ); then
    echo "Emacs directory already exists"
else
  echo "Copying .emacs.d directory from host machine..."
  cp -Rvp /vagrant/config/emacs.d /home/vagrant/.emacs.d
fi

echo "Installing leiningen 2.0"

if (! (/home/vagrant/bin/lein version 2> /dev/null | grep -q 'Leiningen')); then
  cp -Rvp /vagrant/leinsetup.sh /home/vagrant/
  chmod +x /home/vagrant/leinsetup.sh
  su -c "cd /home/vagrant && ./leinsetup.sh" vagrant
  chown -R vagrant /home/vagrant/
  rm /home/vagrant/leinsetup.sh
else
  echo System has Leiningen installed
fi

echo "Checking for Docker install..."
if (! (docker -v 2> /dev/null | grep -q 'Docker')); then
  echo "Installing latest Docker..."
  su -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
  su -c "curl -s https://get.docker.io/gpg | apt-key add -"
  apt-get install -y lxc-docker
else
  echo System has Docker installed
fi

VHOST=`netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10`

echo "Setting environment variables for vhost [$VHOST]..."
echo "export DISPLAY=$VHOST:0.0" 	>> /home/vagrant/.bashrc
echo "export BROWSER=chromium-browser 	>> /home/vagrant/.bashrc
