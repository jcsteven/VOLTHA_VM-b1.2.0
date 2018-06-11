#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for installing requirec packages for VOTHA_VM 
# JC Yu,     June 07,2018
# -------------------------------------------------------

#---Install basic package
#sudo apt-get install vim vim-gtk openssh-server  --yes
#sudo apt-get install samba   --yes
sudo apt-get install binfmt-support   --yes
#sudo apt install vagrant  --yes
#sudo sudo apt-get install virt-manager  --yes


sudo apt update
sudo apt upgrade --yes
sudo apt install python-pip --yes
sudo pip install --upgrade pip

sudo apt install git --yes
sudo apt install make --yes
sudo apt install virtualenv --yes
sudo apt install curl --yes
sudo apt install jq --yes
sudo apt install libssl-dev --yes
sudo apt install libffi-dev --yes
sudo apt install libpcap-dev --yes

sudo apt install python --yes
sudo apt install python-dev --yes

sudo apt install repo --yes

sudo apt install sshpass  --yes

#---Install docker
sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine
sudo usermod -aG docker $(whoami)
sudo reboot
#sudo systemctl status docke






