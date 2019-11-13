#!/bin/sh

set -eux

cp /build/assets/apk-repositories /etc/apk/repositories

apk update
apk upgrade
