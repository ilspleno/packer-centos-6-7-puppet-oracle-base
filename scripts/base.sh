#!/bin/bash
whoami > /tmp/whoami

## Very temporary
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config


