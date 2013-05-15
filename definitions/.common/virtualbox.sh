#!/bin/bash -eux

# The netboot installs the VirtualBox support (old) so we have to remove it
if test -f /etc/init.d/virtualbox-ose-guest-utils ; then
    /etc/init.d/virtualbox-ose-guest-utils stop
fi

# remove any existing packages
rmmod vboxguest
aptitude -y purge virtualbox-ose-guest-x11 virtualbox-ose-guest-dkms virtualbox-ose-guest-utils

# Install dkms for dynamic compiles
apt-get -y install dkms

# If libdbus is not installed, virtualbox will not autostart
apt-get -y install --no-install-recommends libdbus-1-3

# install linux kernel headers needed for VBoxGuestAdditions
apt-get -y install linux-headers-$(uname -r)

mkdir /tmp/vbox
VER=$(cat .vbox_version)
mount -o loop VBoxGuestAdditions_$VER.iso /tmp/vbox
yes|sh /tmp/vbox/VBoxLinuxAdditions.run
umount /tmp/vbox
rmdir /tmp/vbox
rm *.iso

# Start the newly built driver
/etc/init.d/vboxadd start