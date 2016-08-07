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

# add veth pair and attach to management bridge for a provider network
#ip link add veth0 type veth peer name veth1 && \
#brctl addif br0 veth0
#
#ip link set dev veth0 up
#ip link set dev veth1 up

#echo "1" > /proc/sys/net/ipv4/ip_forward

# make sure veth1 is picked up my neutron for provider network
#sleep 30
service neutron-server restart
service neutron-linuxbridge-agent restart
service neutron-dhcp-agent restart
service neutron-metadata-agent restart

service neutron-l3-agent restart


#mount 192.168.0.64:/home/bev/Documents/Brackets/partout/agent

exit 0
