#!/bin/sh  -xe

#
# Build the mingw artifacts inside the Fedora container
#

set -euo pipefail
set -x

su -c "dnf install -q -y sudo dnf-plugins-core"
sudo dnf -q builddep  -y mingw/fedora/opencpn-deps.spec
rm -rf build; mkdir build; cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../mingw/fedora/toolchain.cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j2
make package
ls -lR .
