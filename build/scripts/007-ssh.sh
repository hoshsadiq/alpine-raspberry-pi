#!/bin/sh

set -eux

apk add openssh-server

rc-update add sshd default

# todo harden sshd
#  use https://linux-audit.com/audit-and-harden-your-ssh-configuration/ as a starting point
