#!/bin/sh

set -eux

cp /build/assets/pi-init/bin /usr/bin/pi-init
cp /build/assets/pi-init/run /etc/init.d/pi-init

chmod +x /etc/init.d/pi-init /usr/bin/pi-init
rc-update add pi-init
