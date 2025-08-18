#!/bin/bash

IS_FLOATING=$(hyprctl activewindow -j | jq -r '.floating')

if [[ "$IS_FLOATING" = "false" ]]; then
    hyprctl dispatch togglefloating
    hyprctl dispatch resizeactive exact 80% 80%
    hyprctl dispatch centerwindow
else
    hyprctl dispatch togglefloating
fi

