#!/bin/bash -eux

# Fill the disk with zeros and then remove the file.
# This should free up contiguous disk space
dd if=/dev/zero of=/EMPTY bs=1M
rm -rf /EMPTY
