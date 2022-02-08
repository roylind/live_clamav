#!/bin/sh
set -e
export image_name=live_clamav
mkdir /tmp/live_build
cd /tmp/live_build

# Update ClamAV Database
rm -f -R /var/lib/clamav
mkdir /var/lib/clamav
chown 106:108 /var/lib/clamav
freshclam

lb config --image-name $image_name --architectures $arch --bootappend-live "boot=live components locales=$locales keyboard-layouts=$kblayouts keyboard-options=grp:alt_shift_toggle,grp_led:scroll"

# Logo
mkdir ./config/bootloaders/syslinux_common
cp /var/logo.svg ./config/bootloaders/syslinux_common/splash.svg
mkdir ./config/bootloaders/grub-pc
cp /var/logo.png ./config/bootloaders/grub-pc/splash.png

# Copy ClamAV Database
mkdir -p ./config/includes.chroot_after_packages/var/lib/clamav
chown 106:108 ./config/includes.chroot_after_packages/var/lib/clamav
cp -r /var/lib/clamav ./config/includes.chroot_after_packages/var/lib/

# Create Shortcut
mkdir -p ./config/includes.chroot_after_packages/etc/skel/Desktop
cp /shortcuts/* ./config/includes.chroot_after_packages/etc/skel/Desktop
chmod -R +x ./config/includes.chroot_after_packages/etc/skel/Desktop/*.desktop

#Packages
echo xfce4 > ./config/package-lists/my.list.chroot
echo clamtk >> ./config/package-lists/my.list.chroot
echo firefox-esr >> ./config/package-lists/my.list.chroot
echo kwrite >> ./config/package-lists/my.list.chroot
echo network-manager-gnome >> ./config/package-lists/my.list.chroot

#Build
lb build
cp -r /tmp/live_build/$image_name-$arch.hybrid.iso /shared/live_clamav_build_$(date +'%Y.%m.%d_%H_%M').iso    
chown -R $user:$group /shared/

