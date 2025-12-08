
#!/bin/bash

echo '---> Sunshine'

yay -S --noconfirm --needed sunshine

systemctl --user enable sunshine
