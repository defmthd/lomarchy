#!/bin/bash

echo '---> Wine'

yay -S --noconfirm --needed \
  wine-staging wine-mono wine-gecko winetricks
