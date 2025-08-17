#!/bin/bash

yay -S --noconfirm --needed ollama aichat

sudo systemctl enable --now ollama.service

