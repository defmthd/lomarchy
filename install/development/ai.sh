#!/bin/bash

paru -S --noconfirm --needed ollama aichat

# You might want to install ollama-cuda or ollama-rocm

sudo systemctl enable --now ollama.service

