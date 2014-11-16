#!/usr/bin/env bash

apt-get update
apt-get install -y software-properties-common
apt-get install -y emacs24
apt-get install -y clojure
apt-get install -y default-jdk
apt-get install -y x11-xserver-utils
apt-get install -y xterm

echo "Copying .emacs.d directory from host machine..."
cp -Rvp /vagrant/.emacs.d /home/vagrant/.emacs.d

echo "Installing leiningen 2.0"

if (! (/home/vagrant/bin/lein version 2> /dev/null | grep -q 'Leiningen')); then 
  cp -Rvp /vagrant/leinsetup.sh /home/vagrant/ 
  chmod +x /home/vagrant/leinsetup.sh
  su -c "cd /home/vagrant && ./leinsetup.sh" vagrant 
  chown -R vagrant /home/vagrant/
  else
  echo System has Leiningen installed
fi

echo "Setting environment variables on vhost {$VHOST}..."
echo "export DISPLAY=10.0.2.2:0.0" 	>> /home/vagrant/.bashrc

