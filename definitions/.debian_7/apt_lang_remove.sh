#!/bin/bash -eux

# stop translations from being downloaded with apt-update
CONF_FILE=/etc/apt/apt.conf.d/99translations
if [ ! -f $CONF_FILE ]; then
    echo 'Acquire::Languages "none";' >> $CONF_FILE
fi

# remove apt lists
find /var/lib/apt/lists/ -name "*translation*" | xargs -n1 rm -rf