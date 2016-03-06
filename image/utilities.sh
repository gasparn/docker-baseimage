#!/bin/bash
set -e
source /build_scripts/buildconfig
set -x

## Often used tools.
#$apk_install curl less vim
$apk_install less
#ln -s /usr/bin/vim.tiny /usr/bin/vim

## This tool runs a command as another user and sets $HOME.
#cp /build_scripts/bin/setuser /sbin/setuser
