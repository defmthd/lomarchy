#!/bin/bash

IS_FLOATING=$(hyprctl activewindow -j | jq -r '.floating')

if [[ "$IS_FLOATING" = "false" ]]; then
    hyprctl dispatch togglefloating
    hyprctl dispatch centerwindow
    hyprctl dispatch resizeactive exact 80% 80%
else
    hyprctl dispatch togglefloating
fi

