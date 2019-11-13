#!/usr/bin/env sh

find /build/scripts/ -name '*.sh' -print0 \
    | sort -z \
    | xargs -t -0 -n1 sh
