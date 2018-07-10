#!/bin/bash
### rollback removing packages
sudo apt-get -qy remove  virtualbox-5.2
sudo apt-get -qy remove  vagrant
sudo apt-get -qy remove gcc make perl
sudo apt -y autoremove
#####
wget -q https://releases.hashicorp.com/vagrant/2.1.2/vagrant_2.1.2_x86_64.deb -O ../tmp/vagrant.deb
wget -q https://download.virtualbox.org/virtualbox/5.2.14/virtualbox-5.2_5.2.14-123301~Ubuntu~bionic_amd64.deb -O ../tmp/vbox.deb
sudo dpkg -i ../tmp/vagrant.deb
sudo dpkg -i ../tmp/vbox.deb
### Installing vbox Dependencias
sudo apt -y --fix-broken install
sudo apt-get -q update
sudo apt-get -qy install gcc make perl
sudo /sbin/vboxconfig
