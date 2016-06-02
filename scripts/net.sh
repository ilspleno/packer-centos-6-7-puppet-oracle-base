#!/bin/sh -x

# Shamelessly stolen from https://github.com/tmclaugh/suitcase

# delete network information so it resets when host is cloned
sudo sed -i -e '/^HWADDR/d' -e '/^UUID/d' /etc/sysconfig/network-scripts/ifcfg-*
if [ "${os_version::1}" == "7" ]; then
    # RHEL uses this in their official AWS image to retain eth0
    sudo ln -fs /dev/null /etc/udev/rules.d/80-net-name-slot.rules

    # rename biosdevname files to eth files.
    #
    # NOTE: This should be run at the end of every build. This is why some
    # actions may seem unnecessary.  They are probably needed during an
    # earlier build in the image generation process.
    i=0
    for _nic in $(find /etc/sysconfig/network-scripts/ifcfg-* ! -name ifcfg-lo); do
        sudo mv $_nic /etc/sysconfig/network-scripts/ifcfg-eth${i}
        sudo sed -i -e "s/^DEVICE=.*/DEVICE=eth${i}/" -e "s/^NAME=.*/NAME=eth${i}/" /etc/sysconfig/network-scripts/ifcfg-eth${i}
        i=$(expr $i + 1)
    done
else
    sudo rm -f /etc/udev/rules.d/*persistent-net.rules
fi
