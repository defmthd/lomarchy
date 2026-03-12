#!/bin/bash

echo '---> IO switch to ADIOS scheduler'

UDEV_FILE="/etc/udev/rules.d/60-ioschedulers.rules"

UDEV_CONTENT=$(cat <<'UDEV'
# HDD
ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="1", \
    ATTR{queue/scheduler}="bfq"

# SSD
ACTION=="add|change", KERNEL=="sd[a-z]*|mmcblk[0-9]*", ATTR{queue/rotational}=="0", \
    ATTR{queue/scheduler}="adios"

# NVMe SSD
ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/rotational}=="0", \
    ATTR{queue/scheduler}="adios"
UDEV
)

if [ ! -f "$UDEV_FILE" ]; then
  echo "$UDEV_CONTENT" | sudo tee "$UDEV_FILE" > /dev/null

  sudo udevadm control --reload-rules
  sudo udevadm trigger
fi
