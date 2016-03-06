#!/bin/bash
set -e
source /build_scripts/buildconfig
set -x

#rm -rf /build_scripts
rm -rf /tmp/* /var/tmp/*
rm -rf /var/cache/apk/*

rm -f /etc/ssh/ssh_host_*
