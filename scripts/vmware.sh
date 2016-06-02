#!/bin/bash

# Bail if we are not running inside VMWare.
if [[ `/opt/puppetlabs/bin/facter virtual` != "vmware" ]]; then
    exit 0
fi

# Install the VMWare Tools from a linux ISO.

#wget http://192.168.0.185/linux.iso -P /tmp
sudo mkdir -p /mnt/vmware
sudo mount -o loop /home/vagrant/linux.iso /mnt/vmware

cd /tmp
sudo tar xzf /mnt/vmware/VMwareTools-*.tar.gz

sudo umount /mnt/vmware
sudo rm -fr /home/vagrant/linux.iso

sudo /tmp/vmware-tools-distrib/vmware-install.pl -d
sudo rm -fr /tmp/vmware-tools-distrib
