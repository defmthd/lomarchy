#!/bin/bash

echo '---> sysctl'

sudo cp $(pwd)/config/sysctl/99-network.conf /etc/sysctl.d/99-network.conf
sudo sysctl -p /etc/sysctl.d/99-network.conf
