#!/bin/sh

set -eux

targetHostname="rpi"

# base stuff
apk add ca-certificates
update-ca-certificates
#ln -sT /etc/ssl /usr/ssl

setup-hostname "$targetHostname"
echo "127.0.0.1    $targetHostname $targetHostname.localdomain" > /etc/hosts
setup-keymap gb gb
