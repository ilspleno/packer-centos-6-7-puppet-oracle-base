#!/bin/bash

## Very temporary
#echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Add EPEL and Puppet repos
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm

# Install dev tools and misc packages needed later on
yum -y install curl rsync

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config


