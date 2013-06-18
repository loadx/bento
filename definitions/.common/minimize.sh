#!/bin/bash -eux

# remove all copyright files
rm -rf /usr/share/doc/*/copyright*

# remove all of the languages except english
echo 'localepurge localepurge/remove_no note' | debconf-set-selections
echo 'localepurge localepurge/dontbothernew boolean false' | debconf-set-selections
echo 'localepurge localepurge/showfreedspace boolean false' | debconf-set-selections
echo 'localepurge localepurge/none_selected boolean false' | debconf-set-selections
echo 'localepurge localepurge/verbose boolean false' | debconf-set-selections
echo 'localepurge localepurge/nopurge multiselect en, en_US, en_US.ISO-8859-15, en_US.UTF-8' | debconf-set-selections
echo 'localepurge localepurge/quickndirtycalc boolean false' | debconf-set-selections
echo 'localepurge localepurge/mandelete boolean true' | debconf-set-selections
apt-get install localepurge
sudo localepurge

# remove un-used software
apt-get -y --purge remove xserver-common xserver-xorg xserver-xorg-core mutt w3m reportbug

# remove unused libs
apt-get -y --purge remove x11-common x11-xkb-utils xfonts-base xfonts-encodings xfonts-utils xfonts-utils xfonts-base language-pack-gnome-en language-pack-gnome-en-base libx11-6 libx11-data

# cleanup unused pkgs
apt-get -y autoremove

# remove installer logs
rm -rf /var/log/installer

# remove caches
rm -rf /var/cache/apt/*
rm -rf /var/cache/localepurge/*