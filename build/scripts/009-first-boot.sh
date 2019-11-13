#!/bin/sh

set -eux

# ideally these will be installed before on first boot but internet is not guaranteed
apk add --virtual resizepart e2fsprogs-extra parted

cp /build/assets/firstboot/bin /usr/bin/first-boot
cp /build/assets/firstboot/run /etc/init.d/first-boot

chmod +x /etc/init.d/first-boot /usr/bin/first-boot
rc-update add first-boot
