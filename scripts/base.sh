#!/bin/bash
whoami > /tmp/whoami

## Very temporary
#echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Update the box
#yum -y update
yum -y groupinstall "Development Tools"
yum -y install wget kernel-devel kernel-headers vim wget curl rsync

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config


