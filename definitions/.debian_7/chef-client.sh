#!/bin/bash -eux
export http_proxy=http://10.0.2.2:8123
export use_proxy=on
tmp_dir=$(mktemp -d -t tmp.XXXXXXXX || echo "/tmp")
filename="chef_11.4.4-1.debian.6.0.5_amd64.deb"
url="https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/$filename"
wget -O "$tmp_dir/$filename" $url
dpkg -i "$tmp_dir/$filename"
