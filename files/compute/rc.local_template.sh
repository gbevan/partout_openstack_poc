#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

echo "*** rc.local starting *******************************************"

mount -a || /bin/true                 # FIRSTBOOT

cd /opt/partout/agent || exit 1       # FIRSTBOOT
bin/partout-agent --once              # FIRSTBOOT

(
sleep 60
echo "!!! neutron linuxbridge cleanup starting !!!!!!!!!!!!"
service neutron-linuxbridge-cleanup restart
echo "!!! neutron linuxbridge cleanup finished !!!!!!!!!!!!"
) &

echo "*** rc.local finished *******************************************"

exit 0
