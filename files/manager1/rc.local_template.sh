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

mount -a                              # FIRSTBOOT

cd /opt/partout/agent || exit 1       # FIRSTBOOT
bin/partout-agent --once              # FIRSTBOOT

exit 0
