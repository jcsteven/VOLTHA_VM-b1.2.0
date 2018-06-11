#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for installing requirec packages for VOTHA_VM 
# JC Yu,     June 07,2018
# -------------------------------------------------------

# Fix locale
#sudo sh -c "echo 'LANG=\"en_US.UTF-8\"' >> /etc/default/locale"
sudo sh -c "echo 'LC_ALL=\"en_US.UTF-8\"' >> /etc/default/locale"
sudo sh -c "echo 'LANGUAGE=\"en_US.UTF-8\"' >> /etc/default/locale"
sudo reboot







