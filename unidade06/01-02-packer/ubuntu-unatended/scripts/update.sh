#!/bin/sh -eux
# Update the package list
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get  install gcc build-essential dkms linux-headers-$(uname -r) -y

