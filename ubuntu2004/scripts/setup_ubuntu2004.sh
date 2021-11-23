#!/bin/bash
echo '> Cleaning all audit logs ...'
if [ -f /var/log/audit/audit.log ]; then
sudo cat /dev/null > /var/log/audit/audit.log
fi
if [ -f /var/log/wtmp ]; then
sudo cat /dev/null > /var/log/wtmp
fi
if [ -f /var/log/lastlog ]; then
sudo cat /dev/null > /var/log/lastlog
fi
# Cleans SSH keys.
#echo '> Cleaning SSH keys ...'
#sudo rm -f /etc/ssh/ssh_host_*
# Sets hostname to localhost.
echo '> Setting hostname to localhost ...'
sudo cat /dev/null > /etc/hostname
sudo hostnamectl set-hostname localhost
# Cleans apt-get.
echo '> Cleaning apt-get ...'
sudo apt-get clean
# Cleans the machine-id.
echo '> Cleaning the machine-id ...'
sudo truncate -s 0 /etc/machine-id
sudo rm /var/lib/dbus/machine-id
sudo ln -s /etc/machine-id /var/lib/dbus/machine-id
