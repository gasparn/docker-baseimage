#!/bin/bash
set -e
source /build_scripts/buildconfig
set -x

## Install init process.
cp /build_scripts/bin/my_init /sbin/
mkdir -p /etc/my_init.d
mkdir -p /etc/service
mkdir -p /etc/default
cp /build_scripts/default/* /etc/default
#mkdir -p /etc/container_environment
#touch /etc/container_environment.sh
#touch /etc/container_environment.json
#chmod 700 /etc/container_environment

#groupadd -g 8377 docker_env
#chown :docker_env /etc/container_environment.sh /etc/container_environment.json
#chmod 640 /etc/container_environment.sh /etc/container_environment.json
#ln -s /etc/container_environment.sh /etc/profile.d/

## Install runit.
$apk_install runit

## Install a syslog daemon and logrotate.
#[ "$DISABLE_SYSLOG" -eq 0 ] && /build_scripts/services/syslog-ng/syslog-ng.sh || true

## Install the SSH server.
#[ "$DISABLE_SSH" -eq 0 ] && /build_scripts/services/sshd/sshd.sh || true

## Install cron daemon.
#[ "$DISABLE_CRON" -eq 0 ] && /build_scripts/services/cron/cron.sh || true
