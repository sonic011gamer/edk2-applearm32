#!/bin/bash
cd BootShim
rm BootShim.bin
make UEFI_BASE=0x40004000 UEFI_SIZE=0x00AE0000
rm BootShim.elf
cd ..
# based on the instructions from edk2-platform
set -e
. ./scripts/build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabi- build -j$(nproc) -s -n 0 -a ARM -t GCC5 -p APPLEPkg/Devices/iphone4.dsc
cat BootShim/BootShim.bin workspace/Build/APPLEPkg/DEBUG_GCC5/FV/APPLEPKG_UEFI.fd > workspace/iphone4.bin
#cp workspace/Build/APPLEPkg/DEBUG_GCC5/FV/APPLEPKG_UEFI.fd workspace/iphone4.bin
