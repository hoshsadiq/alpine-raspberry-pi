# alpine-raspberry-pi

This repository contains automated builds of a sys installation of Alpine Linux. These images can be directly burned onto an SD card and/or directly used with packer using [packer-builder-arm-image](https://github.com/solo-io/packer-builder-arm-image).

Please note the aim of this repository is to provide aarch64 builds only.

## Support
Currently only the following boards will be supported and their current status. Other boards will added in the future.

#### Server editions
The following server editions are available.

|Board|Minimal|Full|Containerd|Podman|Docker|K3s|
|-----|-------|----|----------|------|------|---|
|RPi 3 Model A+|TBD|TBD|TBD|TBD|TBD|TBD|
|RPi 3 Model B|[Download Latest]()|TBD|TBD|TBD|TBD|TBD|
|RPi 3 Model B+|[Supported Latest]()|TBD|TBD|TBD|TBD|TBD|
|RPi 4 Model B|TBD|TBD|TBD|TBD|TBD|TBD|

#### Desktop editions
The following desktop editions are planned to be released.

|Board|XFCE|LXQt|Mate|
|-----|----|----|----|
|RPi 3 Model A+|TBD|TBD|TBD|
|RPi 3 Model B|TBD|TBD|TBD|
|RPi 3 Model B+|TBD|TBD|TBD|
|RPi 4 Model B|TBD|TBD|TBD|
