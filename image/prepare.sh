#!/bin/sh
set -e
source /build_scripts/buildconfig
set -x

## Prevent initramfs updates from trying to run grub and lilo.
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
## http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594189
#export INITRD=no
#mkdir -p /etc/container_environment
#echo -n no > /etc/container_environment/INITRD

## Update APK package repository
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
apk update

## Upgrade all packages
apk upgrade

## Lets get core utilities
$apk_install bash shadow

## Replace the 'ischroot' tool to make it always return true.
## Prevent initscripts updates from breaking /dev/shm.
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
## https://bugs.launchpad.net/launchpad/+bug/974584
#dpkg-divert --local --rename --add /usr/bin/ischroot
ln -sf /bin/true /usr/bin/ischroot

## Fix locale.
#$apk_install language-pack-en
#locale-gen en_US
#update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8
#echo -n en_US.UTF-8 > /etc/container_environment/LANG
#echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE
