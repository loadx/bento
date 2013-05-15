# init.d script for zerofree
echo '
#! /bin/sh
### BEGIN INIT INFO
# Provides:          zerofree
# Required-Start:
# Required-Stop:
# Default-Start:     1
# Default-Stop:
# Short-Description: Clean free space on the disk using zerofree
# Description:       To use this script you should first place a file in /tmp/ 
#                    zerofree.start, then when you restart the machine or enter
#                    single user mode, zerofree will begin compression.
#
#                    Once completed this script will destroy the tmp file and 
#                    restart the machine. (this allows the disk to remount correctly)
### END INIT INFO
#
# Author:   Mat Brennan <mbrennan@afainsurance.com>
#
PATH=/bin:/usr/bin/:sbin:/usr/sbin
DISK=$(df -k / | grep "/" | cut -d " " -f1)

test -f /tmp/zerofree.start  || exit 0

case "$1" in
    start)
        echo "Starting zerofree on ${DISK}"
        mount -o remount,ro /
        zerofree -v ${DISK}
        mount -o remount,rw /
        rm -rf /tmp/zerofree.start
        telinit 2
    ;;

    stop)
    ;;

    *)
        echo "usage: /etc/init.d/zerofree {start}"
    ;;
esac

exit 0' | sudo tee /etc/init.d/zerofree > /dev/null; 

# create the kickstart file
echo 'start' >> /tmp/zerofree.start

# add to run level 1 init.d
chmod +x /etc/init.d/zerofree
/usr/sbin/update-rc.d zerofree start 20 1 .

# kick off single user mode, which will cause zerofree to fire (runlevel 1)
/sbin/telinit 1