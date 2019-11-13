#!/bin/sh

set -eux

apk add chrony
setup-timezone -z UTC # users are encouraged to change this to their own timezone
rc-update add chronyd default
