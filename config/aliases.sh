alias ls="eza -lah"
alias y="yazi"
alias vim="nvim"
alias ul="yay -Suy --noconfirm --needed"

function ur () {
  sudo reflector --verbose --country 'Russia' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
  sudo pacman -Syyy
  ul
}

# Download new screensaver
# Example:
#   dwn-ss https://www.youtube.com/watch?v=TwbW0iKofOw
# alias dwn-ss="yt-dlp --output='screensaver' --force-overwrites --format 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]' --cookies-from-browser chrome"

function mount_nas () {
  item=$(op item get "Colossus - DSM" --format json)
  username=$(echo "$item" | jq -r '.fields[] | select(.id=="username") | .value')
  password=$(echo "$item" | jq -r '.fields[] | select(.id=="password") | .value')

  gio mount smb://$username:$password@192.168.1.69/Downloads
  gio mount smb://$username:$password@192.168.1.69/Main
  gio mount smb://$username:$password@192.168.1.69/Docker
}

