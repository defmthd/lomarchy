#!/bin/bash

echo '---> Optimize grub'

if ! grep -q "GRUB_CMDLINE_LINUX_DEFAULT.*splash" /etc/default/grub; then
    current_cmdline=$(grep "^GRUB_CMDLINE_LINUX_DEFAULT=" /etc/default/grub | cut -d'"' -f2)

    new_cmdline="$current_cmdline"

    if [[ ! "$current_cmdline" =~ splash ]]; then
      new_cmdline="$new_cmdline splash mitigations=off raid=noautodetect selinux=0 nowatchdog numa=off ipv6.disable=1"
    fi

    # Trim any leading/trailing spaces
    new_cmdline=$(echo "$new_cmdline" | xargs)

    sudo sed -i "s/^GRUB_CMDLINE_LINUX_DEFAULT=\".*\"/GRUB_CMDLINE_LINUX_DEFAULT=\"$new_cmdline\"/" /etc/default/grub

    # Regenerate grub config
    sudo grub-mkconfig -o /boot/grub/grub.cfg
else
    echo "GRUB already configured with my kernel params"
fi
