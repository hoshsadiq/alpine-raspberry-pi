#!/bin/sh

set -eux

apk add linux-rpi
apk add linux-firmware-brcm
apk add raspberrypi-bootloader-cutdown
#apk add raspberrypi-bootloader


apk manifest linux-rpi | \
    awk "/${RPI_CI_DTB_FILES:--dtb$}/{print \"/\"\$2}" | \
    while read dtb; do
        cp "$dtb" "/boot"
    done
