#!/bin/sh

set -eux

for service in devfs dmesg mdev; do
	rc-update add $service sysinit
done

for service in modules sysctl hostname bootmisc swclock syslog; do
	rc-update add $service boot
done
rc-update del hwclock boot || true

for service in dbus local networking avahi-daemon; do
	rc-update add $service default
done

for service in mount-ro killprocs savecache; do
	rc-update add $service shutdown
done
