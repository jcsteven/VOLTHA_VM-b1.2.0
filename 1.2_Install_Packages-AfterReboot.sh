#!/bin/bash
# -------------------------------------------------------
# Automatic preparation script for installing requirec packages for VOTHA_VM 
# JC Yu,     June 07,2018
# -------------------------------------------------------

#---Install Docker-compose package
sudo curl -L "https://github.com/docker/compose/releases/download/1.10.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version






