#!/usr/bin/env bash

set -euo pipefail

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )

rootfs="$1"

exec_script() {
  script="$1"

  relative_script_path="$(realpath --relative-to="$script_dir" "$script")"

  echo -e "\e[1;94m=> executing script $script ($relative_script_path)\e[0m"

  if ! "$rootfs/enter-chroot" sh -euxc "/$relative_script_path"; then
    echo -e "\e[1;31m=> script $script failed\e[0m"
    exit 1
  fi

  echo -e "\e[1;32m=> script $script ran successfully\e[0m"
}

find "$script_dir/build/scripts" -name '*.sh' -print0 | \
  sort -z | \
  while IFS= read -r -d '' item; do
    exec_script "$item"
  done
