#!/bin/sh

set -eux

cp /build/assets/network-interfaces /etc/network/interfaces

apk add dbus avahi
