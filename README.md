# OpenWRT - domos
This branch is based on https://github.com/openwrt/openwrt tag v19.07.4

## prerequisites
* ubuntu 20.04
* `sudo apt-get install -y build-essential git libncurses-dev libusb-1.0-0-dev`

## Building a gateway image
* Get the repository : `mkdir -p ~/git && cd ~/git && git clone git@github.com:RandomReaper/openwrt.git domos-openwrt && cd domos-openwrt`
* Install submodules `./scripts/feeds update -a && ./scripts/feeds install -a`
* Copy the domos configuration : `cp config-domos .config`
FIXME : add files
* build the whole thing : `make -j9`

## Flashing - setup
```
sudo apt-get install -y libusb-1.0-0-dev
mkdir -p ~/git && cd ~/git && git clone --depth=1 https://github.com/raspberrypi/usbboot && cd usbboot
make
```
### flashing
* Put the compute module into the io board
* Power the module, using an external power supply
* Connect the module to the host computer
* Configure the compute module as a block device : `sudo ~/git/usbboot/rpiboot`
* Find the new device block name (for instance using `dmesg` or `lsblk`), it should look like `/dev/sdX`. *WARNING:* In the next step you can destroy all your data if you don't get it right.
* Flash the compute module (replace /dev/sdX by the device name):
```
zcat bin/targets/brcm2708/bcm2709-glibc/openwrt-brcm2708-bcm2709-rpi-2-squashfs-factory.img.gz | sudo dd status=progress bs=4M of=/dev/sdX
```
### re-flashing (from the gateway)
#### Complete reflash (will erase configuration)
0. Copy the update file `scp bin/targets/brcm2708/bcm2709-glibc/openwrt-brcm2708-bcm2709-rpi-2-squashfs-sysupgrade.img.gz root@IP:/tmp`
0. From the gateway : `sysupgrade -n /tmp/openwrt*.img.gz`
0. The gateway should disconnect and should have rebooted in 1min30.
