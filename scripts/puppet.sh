#!/bin/bash

# Install puppet
sudo yum -y install https://yum.puppetlabs.com/puppetlabs-release-pc1-el-6.noarch.rpm
sudo yum -y install puppet

# Add /opt/puppetlabs/bin to the path so we can use facter
echo "export PATH=/opt/puppetlabs/bin:\$PATH" > /etc/profile.d/puppet.sh

# And set it now so I can use it immediately...
export PATH=/opt/puppetlabs/bin:$PATH

