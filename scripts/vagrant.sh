#!/bin/bash

# Vagrant specific
date > /etc/vagrant_box_build_time

# Create user and groups
groupadd vagrant -g 999
useradd vagrant -g vagrant -G wheel -u 900 -s /bin/bash
echo "vagrant" | passwd --stdin vagrant

# sudo
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Oracle Base Environment' > /etc/motd
