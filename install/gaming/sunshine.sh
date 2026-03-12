
#!/bin/bash

echo '---> Sunshine'

paru -S --noconfirm --needed sunshine

systemctl --user enable sunshine
