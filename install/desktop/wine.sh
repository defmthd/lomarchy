#!/bin/bash

echo '---> Wine'

paru -S --noconfirm --needed \
  wine-staging wine-mono wine-gecko winetricks
