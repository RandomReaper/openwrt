#!/bin/bash
make -j9 || exit
DATE=$(date -I)
cp ./bin/targets/brcm2708/bcm2709-glibc/openwrt-brcm2708-bcm2709-rpi-2-squashfs-sysupgrade.img.gz "domos-openwrt-$DATE-sysupgrade.img.gz"
cp ./bin/targets/brcm2708/bcm2709-glibc/openwrt-brcm2708-bcm2709-rpi-2-squashfs-factory.img.gz "domos-openwrt-$DATE-factory.img.gz"
