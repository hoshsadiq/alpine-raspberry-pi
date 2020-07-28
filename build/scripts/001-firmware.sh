#!/bin/sh

set -eux

# this also doesn't work
#mkdir -p /tmp/firmware
#wget -O- https://github.com/raspberrypi/firmware/archive/master.tar.gz | \
#  tar -xzvf - -C /tmp/firmware --strip-components=1
#
#mv /tmp/firmware/boot/* /boot/
#mv /tmp/firmware/modules /lib/modules
#
#wget -O- https://github.com/RPi-Distro/firmware-nonfree/archive/master.tar.gz | \
#  tar -xzvf -  -C /lib/firmware --strip-components=1 firmware-nonfree-master/brcm

apk add linux-rpi
#apk add linux-rpi4 # todo for rpi4
apk add linux-firmware-brcm
apk add raspberrypi-bootloader

dtb_file_copied=false

while read -r dtb; do
  cp "$dtb" "/boot"
  dtb_file_copied=true
done <<EOT
  $(apk manifest linux-rpi | awk "/${RPI_CI_DTB_FILES:-\.dtb$}/{print \"/\"\$2}")
EOT

cp -r "$(dirname "/$(apk manifest linux-rpi | awk '/overlays/{print $2}' | head -n1)")" /boot

if [ "$dtb_file_copied" != "true" ]; then
  echo "\e[1;31mDidn't find any device tree blobs to copy... exiting... \e[0m"
  exit 1
fi
