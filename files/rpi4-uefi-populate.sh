#/bin/bash
# https://github.com/pftf/RPi4/releases/download/v1.21/RPi4_UEFI_Firmware_v1.21.zip
# fimware can boot windows 10 or Linux on RPI
## sysboot os-prober to play nice with any other Linux-i or etc. 
## one of these days I'll get a hand with making a dope Pentoo Plymouth theme. 


rpi4-uefi-populate () {
echo "fetching rpi4 uefi firmware , you can then pick grub or ssd or usb via the emulated bios Screen "
 wget https://github.com/pftf/RPi4/releases/download/v1.21/RPi4_UEFI_Firmware_v1.21.zip && unzip package.zip -d /mnt/{$gentoo-rpi}/boot/efi
 #push to fchroot /chroot 
}

rpi4-uefi-build-grub () {
cat <<EOM >> /mnt/{$gentoo-rpi}/etc/portage/make.conf
# Setup GRUB platforms
GRUB_PLATFORMS="efi-arm64 arm-efi pc"
EOM
_punch-grub
}


## zfs for mounted remote disks or to recover a volume but unwise .. or if user is using host zfs with chroot add typical options for grub. 
### dev-util/rpmdevtools can build kernel rpm , for sneeker neting binary kernel ie Gentoo Pentoo sabayon etc. app-arch/rpm2targz foir binpkg. 

punch-grub () { 
cat <<EOG >> /mnt/{$gentoo-rpi}/build-grub-arm64.sh 
GRUB_PLATFORMS="efi-32 efi-64 efi-arm64 arm-efi pc" USE="device-mapper efiemu fonts mount themes truetype libzfs libkms
pango split-usr"  emerge sys-fs/zfs-kmod sys-fs/zfs sys-boot/os-prober sys-boot/plymouth-openrc-plugin sys-boot/grub dev-embedded/u-boot-tools /sys-kernel/dracut dev-util/rpmdevtools app-arch/rpm2targz
echo -e '\r'
EOG
# https://stackoverflow.com/questions/51305706/shell-script-that-does-chroot-and-execute-commands-in-chroot

#chroot_build() { /home/mayank/chroot/codebase /bin/bash <<"EOT"
# cd /tmp/so
# ls -l
#echo $$
#EOT
#} 
