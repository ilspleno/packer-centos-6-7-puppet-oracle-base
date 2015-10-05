#!/bin/bash

# Update the box
yum -y update

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config


