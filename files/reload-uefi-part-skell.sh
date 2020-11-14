#/bin/bash/
### for now restore a hacked parts table 
## for use in Rock64pro or laptop script dose most however ... 
## newer Rock64 Pro etc firmware /uboot supports UEFI 
#
### BIOS GRUB @ 10 Megs of slack if Making COMBO/Image 
#
###  ie UEFI rock64pro/pinebook/pro /RPi4 /3 if uboot.. blobs are pined 
## some of thier SPI/bash scripts will carve a partition with Loaders , hence 10 megs of slack on bios Grub just enough room for boot blobs if..... 
## https://github.com/Jannik2099/gentoo-pinebookpro generates nice layout for device but not always UEFI. 

### mesa needs rpi4/rpi3  GPU & Mali/panfrost but makes Binhosting or other logistics less irksome as only some image bits require masaging. 
#
# https://stikonas.eu/wordpress/2019/09/15/blobless-boot-with-rockpro64/ # 
# 
## 1o MiB for Bios Grub including SLACK for any blobs written to space. as hidden parts latter. rock64 dose this behavior, rpi uboot or the slick loaders could perhaps also ...
## space is provided. 
## 120 for UEFI may need to upsize. /boot/efi 
## 650 for Grub/Kernels /boot 
# rem 15 gigs @ root:/  @ wich most have a 1st boot self expander service to grow FS. 
sfdisk ${SDCARD_DEVICE} <memcard.arm64-uefi-part-skell.txt
