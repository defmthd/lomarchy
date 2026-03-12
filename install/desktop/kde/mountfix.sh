#!/bin/bash

echo '---> Mount fix'

POLKIT_FILE="/etc/polkit-1/rules.d/10-udisks2-nopass.rules"

POLKIT_CONTENT=$(cat <<'POLKIT'
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount-system") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});
POLKIT
)

if [ ! -f "$POLKIT_FILE" ]; then
  echo "$POLKIT_CONTENT" | sudo tee "$POLKIT_FILE" > /dev/null
fi
