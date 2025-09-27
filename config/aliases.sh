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
alias dwn-ss="yt-dlp --output='screensaver' --force-overwrites --format 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]' --cookies-from-browser chrome"

