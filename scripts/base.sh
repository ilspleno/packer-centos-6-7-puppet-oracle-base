#!/bin/bash

## Very temporary
#echo "nameserver 8.8.8.8" > /etc/resolv.conf
id
sudo id

# Add EPEL and Puppet repos
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
sudo yum -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm

# Install dev tools and misc packages needed later on
sudo yum -y install curl rsync

# Tweak sshd to prevent DNS resolution (speed up logins)
sudo echo 'UseDNS no' >> /etc/ssh/sshd_config
