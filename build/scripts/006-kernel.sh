#!/bin/sh

set -eux

# todo does cmdline.txt support comments?
cat /build/assets/kernel/cmdline.txt | grep -v '^#' > /boot/cmdline.txt
cp /build/assets/kernel/config.txt /boot/config.txt
cp /build/assets/kernel/fstab.txt /etc/fstab
