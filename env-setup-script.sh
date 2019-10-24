#!/bin/bash

################################################
#  Author: Rupreet Gujral [RG]                  #
#################################################

#let's update the cache in docker itself
apt-get update 

apt-get install -y apt-utils 

apt-get install -y curl

apt-get -y -qq install net-tools


#Get .NET core and install
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 3.0

apt-get install -y snapd

#Get VS code and install
snap install code --classic

apt-get -y  install nodejs

apt-get -y install npm

npm install -g @vue/cli
