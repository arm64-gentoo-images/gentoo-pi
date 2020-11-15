#/bin/bash
## rigg Mesa for most AARCH64 use cases on embeded Hardware . 
### Nvidia Geforce AACH64 is working if you have an Arm64 Server/Workstation unit however support is poor-ish in Gentoo atm. 
### adds more than https://github.com/Jannik2099/gentoo-pinebookpro , for more universal support. eventually perhaps live F'ing iso. someday  or usb to run a legit gentoo etc installer. 
# https://github.com/necrose99/arm64-portage some setting here. 

do-mesa () {
mkdir -p  /mnt/{$gentoo-rpi}/etc/portage/package.use/
cat <<EOL >> /mnt/{$gentoo-rpi}/etc/portage/package.use/mesa
# Per https://wiki.gentoo.org/wiki/Raspberry_Pi_VC4
media-libs/mesa -classic xa xvmc
# force on v3d support
>=media-libs/mesa-19.2.0_rc1-r2 rpi-v3d
# allow use of libglvnd; migration from app-eselect/eselect-opengl
>=media-libs/mesa-20.0.2 libglvnd vdpau X dri3 egl gallium gbm gles1 gles2 libglvnd llvm osmesa* rpi-v3d vaapi  vulkan  vulkan-overlay  wayland  xa xvmc zstd vdpau
x11-libs/libva-vdpau-driver opengl
media-video/libva-utils X drm wayland 

#VIDEO_CARDS="nouveau fglrx nvidia panfrost vc4 iris freedreno tegra intel vivante radeon lima exynos"

media-libs/mesa video_cards_vc4
#rpi
## rock64 / etc.
media-libs/mesa video_cards_mali
media-libs/mesa  video_cards_bifrost
media-libs/mesa  video_cards_panfrost
# rock64 / etc. 

media-libs/mesa video_cards_nouvea
media-libs/mesa video_cards_nvidia
## some Servers now have Limited Nvidia offical aarch64 RTX Geforce drivers however Gentoo will Need Lots more patching. 
media-libs/mesa video_cards_tegra
# emore likly nouvea or tegra for embeded. 

media-libs/mesa video_cards_exynos

##AMD-arm64 embeded uses radeon varrinats. so... 
media-libs/mesa video_cards_fglrx
media-libs/mesa video_cards_freedreno

EOL
chmode 644 -R /mnt/{$gentoo-rpi}/etc/portage/package.use/
}
