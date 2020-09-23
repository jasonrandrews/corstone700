#!/bin/bash

cd arm-reference-platforms
printf '2\n3\n1\n' | ./sync_workspace.py   --no_check_apt_deps
export DISTRO="iota-tiny"
export MACHINE="corstone700"
export LANG=en_US.UTF-8
source setup-environment
bitbake iota-tiny-image
