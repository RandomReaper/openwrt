#!/bin/bash

# git don't stores r/w permissions, so let's fix that
chmod g-w target/linux/brcm2708/base-files/etc/logrotate.conf
chmod g-w target/linux/brcm2708/base-files/etc/logrotate.d/z-way-server

make -j9 || exit
DATE=$(date -I)
cp ./bin/targets/brcm2708/bcm2709-glibc/openwrt-brcm2708-bcm2709-rpi-2-squashfs-sysupgrade.img.gz "domos-openwrt-$DATE-sysupgrade.img.gz"
cp ./bin/targets/brcm2708/bcm2709-glibc/openwrt-brcm2708-bcm2709-rpi-2-squashfs-factory.img.gz "domos-openwrt-$DATE-factory.img.gz"
